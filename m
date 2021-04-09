Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C00C35A080
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhDIOAa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 10:00:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55191 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbhDIOA3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 10:00:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Apr 2021 07:00:14 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Apr 2021 07:00:12 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Apr 2021 19:29:40 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 802B53AE0; Fri,  9 Apr 2021 19:29:39 +0530 (IST)
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
Subject: [PATCH V2 0/4] Add RTC support for PMIC PMK8350
Date:   Fri,  9 Apr 2021 19:29:22 +0530
Message-Id: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

satya priya (4):
  rtc: pm8xxx: Add RTC support for PMIC PMK8350
  dt-bindings: mfd: Add compatible for pmk8350 rtc
  dt-bindings: mfd: Convert pm8xxx bindings to yaml
  dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings

 .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 99 ----------------------
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 54 ++++++++++++
 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++
 drivers/rtc/rtc-pm8xxx.c                           | 11 +++
 4 files changed, 127 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

