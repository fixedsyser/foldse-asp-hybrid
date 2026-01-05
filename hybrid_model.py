def create_hybrid_predictions(
    y_true, y_pred_ml, y_pred_foldse, ml_confidences, confidence_threshold
):

    """
    Create hybrid predictions by combining predictions from ML and FOLD-SE models based on confidence threshold.

    Parameters
    ----------
    y_true : array-like
        The ground truth target values.
    y_pred_ml : array-like
        The predictions made by the ML model.
    y_pred_foldse : array-like
        The predictions made by the FOLD-SE model.
    ml_confidences : array-like
        The confidence scores associated with the ML model's predictions.
    confidence_threshold : float, optional
        The threshold below which the FOLD-SE model's prediction is used instead of the ML model's prediction.

    Returns
    -------
    y_pred_hybrid : list
        The list of hybrid predictions combining ML and FOLD-SE model predictions.
    """
    y_pred_hybrid = []
    for idx in range(len(y_true)):
        fold_pred = y_pred_foldse[idx]
        ml_pred = y_pred_ml[idx]
        ml_confidence = ml_confidences[idx][ml_pred]

        if ml_confidence < confidence_threshold:
            hybrid_pred = fold_pred
        else:
            hybrid_pred = ml_pred
        y_pred_hybrid.append(hybrid_pred)

    return y_pred_hybrid

    """
    Calculate the confidence threshold based on the accuracies of the FOLD-SE and ML model

    Parameters
    ----------
    acc_ml : float
        the accuracy score of the ML model
    acc_foldse : float
        the accuracy score of the FOLD-SE model.
    base_threshold : float, optional
        The base threshold hyperparameter.
    dynamic_treshold_bool: boolean
        if set to true, use a dynamic threshold
        if set to false, use the static base threshold

    Returns
    -------
    confidence_threshold : float
        The threshold below which the FOLD-SE model's prediction is used instead of the ML model's prediction.
    """
def calculate_threshold(acc_ml, acc_foldse, base_threshold=0.6, dynamic_treshold_bool=True):
    if(dynamic_treshold_bool):
        acc_diff = acc_ml - acc_foldse
        return base_threshold - acc_diff
    else:
        return base_threshold
