Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937F535E678
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Apr 2021 20:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347874AbhDMScy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Apr 2021 14:32:54 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:62373 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346266AbhDMScy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Apr 2021 14:32:54 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0BB2440006;
        Tue, 13 Apr 2021 18:32:31 +0000 (UTC)
Date:   Tue, 13 Apr 2021 20:32:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     satya priya <skakit@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V2 0/4] Add RTC support for PMIC PMK8350
Message-ID: <YHXjv0dviiKgrJ8h@piout.net>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Lee,

On 09/04/2021 19:29:22+0530, satya priya wrote:
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
> 

This is mostly about the RTC driver but the bindings doc is in mfd. How
do you prefer that to be merged? there is no build dependency so I can
take 1 and 4 and you could take 2 and 3. Or one of us can take all 4
patches.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
