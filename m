Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA103FC427
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Aug 2021 10:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240226AbhHaIPe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Aug 2021 04:15:34 -0400
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:47339 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240227AbhHaIPd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Aug 2021 04:15:33 -0400
X-Greylist: delayed 1483 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Aug 2021 04:15:33 EDT
Received: from cmgw10.mail.unifiedlayer.com (unknown [10.0.90.125])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id B12BF8033D20
        for <linux-rtc@vger.kernel.org>; Tue, 31 Aug 2021 07:49:50 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id KyWimf8eUKpssKyWjmm0Ae; Tue, 31 Aug 2021 07:49:50 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=GIfNrsBK c=1 sm=1 tr=0 ts=612ddf1e
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=MhDmnRu9jo8A:10:nop_rcvd_month_year
 a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
 a=MkikGF2PeDrwNyO4gr0A:9 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Q2H2HKL1uokrl2tJeyxsJrFTUnTm6BSdzifIeKOsVhA=; b=S6JrUBd8wRaTG8SQkOCSmVosBH
        LGOxh0GYK/IxWla3MC8O+ZhRUVU/jlNQzIxKvPXkYIx9efOgenLqiHz5k7Ag8SLPi+t/HkVgu9Qok
        tCVUaXsTPS61CuRihJHy0qD/UQsM4nszHgkxTUGtx8gPpq5jw+vvl7eajvkyqw4WpZ5qh7W5OxR8p
        BPr4O0xXbjbaxtnkfFm2KSwZ16F4vspOxFeJKMj5kW0uZ7WNaeqi1otuqP6/73q01+XcclyoRu6hJ
        shbx5yWirIbx7eRJhIauAgcQ2kO2bX+uvfLGaKMo4pUUHzTx5y4MW4viZACRvDpnr2dHYbVM86orS
        m4XUQ+sQ==;
Received: from [117.193.211.216] (port=44562 helo=localhost.localdomain)
        by md-in-79.webhostbox.net with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <navin@linumiz.com>)
        id 1mKyWh-0026XO-JQ; Tue, 31 Aug 2021 07:49:47 +0000
From:   Navin Sankar Velliangiri <navin@linumiz.com>
To:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, navin@linumiz.com
Subject: [PATCH] rtc: bq32000: Add TI BQ32002 compatible
Date:   Tue, 31 Aug 2021 13:19:22 +0530
Message-Id: <20210831074922.273809-1-navin@linumiz.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 117.193.211.216
X-Source-L: No
X-Exim-ID: 1mKyWh-0026XO-JQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [117.193.211.216]:44562
X-Source-Auth: linumcmc
X-Email-Count: 6
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The TI BQ32002 is software compatible with the TI BQ32000,
add DT compatible entries

Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
---
 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 11 +++++++++++
 drivers/rtc/rtc-bq32k.c                               |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
index bf9c1c4ddb7e..2ddf1cc097d8 100644
--- a/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     const: ti,bq32000
+    const: ti,bq32002
 
   reg:
     const: 0x68
@@ -35,6 +36,16 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+     compatible:
+       items:
+         - const: ti,bq32002
+then:
+  properties:
+    trickle-resistor-ohms: false
+    trickle-diode-disable: false
+
 examples:
   - |
     i2c {
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 2235c968842d..a167a6afdc7e 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -307,12 +307,14 @@ static int bq32k_remove(struct i2c_client *client)
 
 static const struct i2c_device_id bq32k_id[] = {
 	{ "bq32000", 0 },
+	{ "bq32002", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bq32k_id);
 
 static const __maybe_unused struct of_device_id bq32k_of_match[] = {
 	{ .compatible = "ti,bq32000" },
+	{ .compatible = "ti,bq32002" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bq32k_of_match);
-- 
2.32.0

