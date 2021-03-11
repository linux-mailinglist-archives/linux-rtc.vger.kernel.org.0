Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16FC336D16
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhCKHar (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 02:30:47 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60375 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhCKHai (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 02:30:38 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 10 Mar 2021 23:30:39 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 10 Mar 2021 23:30:37 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 13:00:10 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 261CA4107; Thu, 11 Mar 2021 13:00:09 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 3/3] dt-bindings: mfd: Add compatible for pmk8350 rtc
Date:   Thu, 11 Mar 2021 12:59:58 +0530
Message-Id: <1615447798-6959-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add compatible string for pmk8350 rtc support.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index b4892f1..676decc 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -53,6 +53,7 @@ patternProperties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pm8018-rtc
+          - qcom,pmk8350-rtc
 
       reg:
         description: Specifies the base address of the RTC registers
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

