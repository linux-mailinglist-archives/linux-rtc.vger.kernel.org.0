Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D51336D17
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 08:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhCKHax (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 02:30:53 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60375 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhCKHaf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 02:30:35 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 10 Mar 2021 23:30:35 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 10 Mar 2021 23:30:32 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 13:00:03 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 28B284107; Thu, 11 Mar 2021 13:00:02 +0530 (IST)
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
Subject: [PATCH 0/3] Add RTC support for PMIC PMK8350
Date:   Thu, 11 Mar 2021 12:59:55 +0530
Message-Id: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert pm8xxx bindings to yaml and add pmk8350 rtc binding.

satya priya (3):
  rtc: pm8xxx: Add RTC support for PMIC PMK8350
  dt-bindings: mfd: Convert pm8xxx bindings to yaml
  dt-bindings: mfd: Add compatible for pmk8350 rtc

 .../devicetree/bindings/mfd/qcom-pm8xxx.txt        |  99 -------------------
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 109 +++++++++++++++++++++
 drivers/rtc/rtc-pm8xxx.c                           |  11 +++
 3 files changed, 120 insertions(+), 99 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

