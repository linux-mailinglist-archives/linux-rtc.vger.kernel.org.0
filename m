Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31B6362B03
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhDPWVB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:21:01 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38629 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhDPWVA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:21:00 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 496E8100006;
        Fri, 16 Apr 2021 22:20:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kgunda@codeaurora.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH V2 0/4] Add RTC support for PMIC PMK8350
Date:   Sat, 17 Apr 2021 00:20:31 +0200
Message-Id: <161861162166.866673.15336346688705513488.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 9 Apr 2021 19:29:22 +0530, satya priya wrote:
> satya priya (4):
>   rtc: pm8xxx: Add RTC support for PMIC PMK8350
>   dt-bindings: mfd: Add compatible for pmk8350 rtc
>   dt-bindings: mfd: Convert pm8xxx bindings to yaml
>   dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings
> 
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 99 ----------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       | 54 ++++++++++++
>  .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   | 62 ++++++++++++++
>  drivers/rtc/rtc-pm8xxx.c                           | 11 +++
>  4 files changed, 127 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>  create mode 100644 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml

Applied, thanks!

[1/4] rtc: pm8xxx: Add RTC support for PMIC PMK8350
      commit: c8f0ca8b7a4b91f637ccd9a55f37dbac73d6f6bf
[4/4] dt-bindings: rtc: qcom-pm8xxx-rtc: Add qcom pm8xxx rtc bindings
      commit: 8138c5f0318c69a878582d2140dac08e6a99880d

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
