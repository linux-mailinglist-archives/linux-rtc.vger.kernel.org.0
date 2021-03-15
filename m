Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E73B33CA34
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 00:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCOX6b (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 15 Mar 2021 19:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbhCOX6L (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 15 Mar 2021 19:58:11 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3FBC06174A
        for <linux-rtc@vger.kernel.org>; Mon, 15 Mar 2021 16:58:11 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 130so33550830qkh.11
        for <linux-rtc@vger.kernel.org>; Mon, 15 Mar 2021 16:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6YKqBcm+PEU7bLjl7noqvBFop32dtEFLXiIvPyN36w=;
        b=c0lge2HX5aHlHFEMH/8ve+vbgixQ5tb4Xr9d5KU+jskvU4MMQsxv2mRFTzial4Wsfm
         HbM3Y3OZ0YdINS4VYd5bzEE6AX5diJa/e7p667Hv5TtM/Sgra+qCbySgdorOGobQu71F
         NVpuGxwhnk6dF9URef08O+LZaxJ+bG1b5CvBuhEWWKJmzRRL50PNblpkL993zQH/pWD9
         8s79st4eUNuQ/WdHpyd1LtBv8KQDmzVqMuUCSyZBnVRCPbDJmc1UEjqZ+nhPmsJWoyub
         9TDyYMtX4wchbwwWWOJXcSE5NLROMfaaUdPFrRV+Ve+f/HWr+KLY82VsHFOJrGiNwq6g
         mi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6YKqBcm+PEU7bLjl7noqvBFop32dtEFLXiIvPyN36w=;
        b=pWerPZtDJrdMWW1KqDXrTqOGNWusX1xWVmyXfMrytIJb+bY2AEercrjkkpljFzXPAQ
         glAJN9uNpCGzcjpgH4tdRcvweYiVYKORFK6kHPj0WJ471OI5IHm9S/8fJPZuh8tSyb7P
         SFGE1TDlymzjdh9rQ2GI+56Q43Tf+85WsvhzxSCqtQqk6uqgpBCCRjEXo4gaqX+q6r7u
         IjPq2pypZxzWW/1wqYos4K6iOFowzclbq6p0RtTQqcOMDFt8IUoXXmi+E0GoFILVepxb
         D83FkSx/WbxUZE9jily4wIHSR3DUdRW1PQfX6z4OP2ck1oAbhT8d4VkTAHDDO4uOuhcl
         qBzA==
X-Gm-Message-State: AOAM532r+jG1uFrGNmJwuOZ9H5iBZCkymU6BUFpb4NxP2hQr2Oq8c9Hf
        B69jtEb2Lv2IMRxrkXFLyyWrm/9/v9Vq/w==
X-Google-Smtp-Source: ABdhPJyaQkDFVPbEOjBPNBNym1rDWCOrUqEAVinbwyvpJt5VAuSzWlKSC5JCP4Nde9NWVN9Ui+UI1Q==
X-Received: by 2002:a37:886:: with SMTP id 128mr29020886qki.430.1615852690967;
        Mon, 15 Mar 2021 16:58:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id d19sm5557109qtn.96.2021.03.15.16.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 16:58:10 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] rtc: mxc: Remove unneeded of_match_ptr()
Date:   Mon, 15 Mar 2021 20:58:00 -0300
Message-Id: <20210315235800.200137-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

i.MX is a DT-only platform, so of_match_ptr() can be safely
removed.

Remove the unneeded of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
index db57dda7ab97..0f08f22df869 100644
--- a/drivers/rtc/rtc-mxc.c
+++ b/drivers/rtc/rtc-mxc.c
@@ -415,7 +415,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 static struct platform_driver mxc_rtc_driver = {
 	.driver = {
 		   .name	= "mxc_rtc",
-		   .of_match_table = of_match_ptr(imx_rtc_dt_ids),
+		   .of_match_table = imx_rtc_dt_ids,
 	},
 	.probe = mxc_rtc_probe,
 };
-- 
2.25.1

