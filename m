Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46191550EE
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2020 04:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgBGDSW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Feb 2020 22:18:22 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60211 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgBGDSV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Feb 2020 22:18:21 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DB061886BF;
        Fri,  7 Feb 2020 16:18:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581045498;
        bh=oDw3d3jhSHyNwZH0g1A6KGGcClAuStfzBG0X0TU94yk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=0QpzyzySD2NOi3hZoCvYYUQtsC5PaJ1Q98n0D846/7+ti/4ilhKqe8/zisckxVxZ/
         406l5+JXn0dFVjJDOj/J0N7+6ATQm3Cmgj10DFuXj1xQxVK4wDIaoDFwCP0JVs3eLN
         0tPgxRVAHld3M7VS4ofM1DowAKzc/lSmh1DVOWk0aJS18089P3OeAHaKI/R5nyVfpz
         4reluWWsnGI3iplcgivZbKc0jbU4+p978aS8Izvb2rWtd7td3MLfcxQIqppYiGSiFM
         sh9JAgpdBLgsWrQ+zfHKK8VkLB8kqOcXHKT7OeK+v8CybbdtIaHqUGPkZKspAG8tcH
         pJilr7GWhyUkw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3cd6fa0001>; Fri, 07 Feb 2020 16:18:18 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id A006813EEDE;
        Fri,  7 Feb 2020 16:18:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id BC43B28006E; Fri,  7 Feb 2020 16:18:18 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v1 1/2] rtc: ds1307: handle oscillator failure flags for ds1388 variant
Date:   Fri,  7 Feb 2020 16:18:11 +1300
Message-Id: <20200207031812.14424-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
References: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The FLAG register is at a different location to the other supported RTCs
so this requires an extra case in the existing switch statement.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/rtc/rtc-ds1307.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 1f7e8aefc1eb..31a38d468378 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -144,6 +144,8 @@ enum ds_type {
 #	define M41TXX_BIT_CALIB_SIGN	BIT(5)
 #	define M41TXX_M_CALIBRATION	GENMASK(4, 0)
=20
+#define DS1388_REG_FLAG			0x0b
+#	define DS1388_BIT_OSF		BIT(7)
 /* negative offset step is -2.034ppm */
 #define M41TXX_NEG_OFFSET_STEP_PPB	2034
 /* positive offset step is +4.068ppm */
@@ -252,6 +254,13 @@ static int ds1307_get_time(struct device *dev, struc=
t rtc_time *t)
 		if (tmp & DS1340_BIT_OSF)
 			return -EINVAL;
 		break;
+	case ds_1388:
+		ret =3D regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
+		if (ret)
+			return ret;
+		if (tmp & DS1388_BIT_OSF)
+			return -EINVAL;
+		break;
 	case mcp794xx:
 		if (!(tmp & MCP794XX_BIT_ST))
 			return -EINVAL;
--=20
2.25.0

