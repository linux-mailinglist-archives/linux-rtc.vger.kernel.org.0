Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A7D357A7A
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 04:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhDHCky (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Apr 2021 22:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhDHCkv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Apr 2021 22:40:51 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4671EC061762
        for <linux-rtc@vger.kernel.org>; Wed,  7 Apr 2021 19:40:40 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id g20so823715qkk.1
        for <linux-rtc@vger.kernel.org>; Wed, 07 Apr 2021 19:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kaqo7uOnV2YyBNUijp7UcFWN/avBdDP9EEhdzkkl5WE=;
        b=JB26clC6ULXtWG80k48Zh7UWjUPR9nqP7NqGXkoLlF2gJe5dhr9Ad0v2HYReSSxf60
         JaitaBkorL8BryI85xwUJEd+4cYVlP6at+ZqWRfxyxKCYMz0yk0Lbst/E9JfwC+4X3N5
         8Sk18NJuHMV33ZMFq1an6JlebOdoLC8q2/y83mCGMNqsmHCAIibEIjTc2s6HHvW2Fvj/
         Bqjk6nwv5DWN6lWMbTogkfOJvxIojigrDNJXCuzTMxHqKhZ65WworVGty5+8MoowmKn3
         9r4CfGmpCAIDAZmM1bMTuIiKp0Vw4cyk3LvTYnC9CK4iXCHwI/GZF+0Ix3DTGtsVDfwh
         sBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kaqo7uOnV2YyBNUijp7UcFWN/avBdDP9EEhdzkkl5WE=;
        b=QiIAENe9hf0nZ9zC+uyQfR7z3ubweI4+8CXs95SejKbKVB3OPCNdbdEwkGe18I5W04
         y74co1VP1MeCq7fGAsG63ujfyWe7RRpPdBvt4utSjeBCQC/3rsG174cAeZbxo4QNL30U
         /dNAt1lkaEgevee9N1AsFKh4/mT7B/92WqAgSXH8XirTUuFRpBtm/hw1lD7b5hwNS0eD
         3o/eUUhcUqw5ydbZWJvj6u+dKGMb6X5ec0rSi4wEcta7GKjxRGbrbFESBfU5AMUa7hs8
         5WFEOT5AzveTG6nPBUaZDzBj7HXFqn7MxBHbmxa/IXEUOd4GinfKDObvms86EdZyfZpD
         58xQ==
X-Gm-Message-State: AOAM531GbdoC0KNdURrSPHC23axYQYXwq6s9s+04LZU19rqe+BHPhNYS
        vfiYrQpUbZ1hl2J56+CMoFupuPO2aQoMuJyt
X-Google-Smtp-Source: ABdhPJy/+ZflvwL02/Qw/Nxh3DNwtQtDjDgMtWXu1oGRWjyqG0rKlFBt3KhlA2iQNJgt1bDTaN7WPg==
X-Received: by 2002:a05:620a:1502:: with SMTP id i2mr6474066qkk.373.1617849638643;
        Wed, 07 Apr 2021 19:40:38 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id v128sm20102383qkc.127.2021.04.07.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:40:38 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v2 1/3] rtc: ab-eoz9: set regmap max_register
Date:   Wed,  7 Apr 2021 22:40:26 -0400
Message-Id: <20210408024028.3526564-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210408024028.3526564-1-liambeguin@gmail.com>
References: <20210408024028.3526564-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Set regmap's max_register property to allow users to dump registers
using debufgs.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index b20d8f26dcdb..dee17a76a72b 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -264,6 +264,7 @@ static const struct rtc_class_ops rtc_ops = {
 static const struct regmap_config abeoz9_rtc_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.max_register = 0x3f,
 };
 
 #if IS_REACHABLE(CONFIG_HWMON)
-- 
2.30.1.489.g328c10930387

