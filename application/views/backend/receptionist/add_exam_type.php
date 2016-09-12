<div class="form-group">
    <div class="form-group">
        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('exam_type'); ?></label>
        <div class="col-sm-7">
            <select name="exam_id" class="select2">
                <option value=""><?php echo get_phrase('select_exam_type'); ?></option>
                <?php foreach ($exam_type_info as $row) { ?>
                    <option value="<?php echo $row['exam_type_id']; ?>"><?php echo $row['name']; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="col-sm-2">
            <button type="button" class="btn btn-default" onclick="deleteParentElement(this)">
                <i class="entypo-trash"></i>
            </button>
        </div>
    </div>
</div>