Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C99362697
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Apr 2021 19:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240608AbhDPRVJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 13:21:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233606AbhDPRVI (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 16 Apr 2021 13:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8CA6613BB;
        Fri, 16 Apr 2021 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618593643;
        bh=DgqWTJb1Z+HKN9VW4qCZgJDVVwJytGX9V+66YuoSKXg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TVRsJBjKQ6RpS0XiwN92qJPEOSAxr8oYInJt+5l04dNdv59fY8aKTcRpm8AHdKAt1
         CoVepH6JQ0zFRJd1IMUBcCwi2+CTYJMZrz+ghjbLyK03+EBPu5r9E3fmLZ8FOx6Ujb
         mDPmrRI94Pz15BgHslmw9+W6IxwR8mDBdGr0HtRr5vZWdXGm76E7hAjMK5ra1whajb
         4x6pMovjYS+H/sAH6B7MPvqVJttTsHmQdokN6XezdbVocjtP4pTSlT8Fpwe4wr1ViT
         andoyMhzN9nczztk8TkscR1XVOTpZ4nwyn2DxbbRcPEjFZvM/IH7+EM/vmsJQ4EjlR
         xMcKgZ2NjjELA==
Received: by mail-ej1-f42.google.com with SMTP id w3so43250948ejc.4;
        Fri, 16 Apr 2021 10:20:43 -0700 (PDT)
X-Gm-Message-State: AOAM533heXkYeLEr5/e04TF2CtX/yZg17pnpnj+HflJutAd4Epev2TTM
        Fjmsa0rKB9LBiWVf2XeacOVLiqmIOLUfxx1pNg==
X-Google-Smtp-Source: ABdhPJyCFfax6nihY7mtSy1gIy1kLGf50Frz/52eDZ9jBaYGNWv32kco7rFKkOeYCtTf3SYQt5biMyijpQlfWkCYOQM=
X-Received: by 2002:a17:906:4fcd:: with SMTP id i13mr9385535ejw.341.1618593642471;
 Fri, 16 Apr 2021 10:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org> <20210414083820.GH4869@dell>
In-Reply-To: <20210414083820.GH4869@dell>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 16 Apr 2021 12:20:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKYQ2EBgQJzKJSy-+D20Pmu_mzUQog03nAw=_PRY-uRjg@mail.gmail.com>
Message-ID: <CAL_JsqKYQ2EBgQJzKJSy-+D20Pmu_mzUQog03nAw=_PRY-uRjg@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
To:     Lee Jones <lee.jones@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Apr 14, 2021 at 3:38 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 09 Apr 2021, satya priya wrote:
>
> > Convert pm8xxx bindings from .txt to .yaml format. Also,
> > split this binding into two: parent binding(qcom-pm8xxx.yaml)
> > and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> >
> > Signed-off-by: satya priya <skakit@codeaurora.org>
> > ---
> > Changes in V2:
> >  - As per Bjorn's comments, I've split this into two, one parent binding
> >    and one child node rtc binding.
> >  - Fixed bot errors and changed maintainer name.
> >
> >  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
> >  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
> >  2 files changed, 54 insertions(+), 100 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
>
> Applied, thanks.

You need to apply the rtc schema too. linux-next has an error on this one now.

Rob
