Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6D36ED41
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 17:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbhD2PTV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 11:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233148AbhD2PTU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 29 Apr 2021 11:19:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB54B61447;
        Thu, 29 Apr 2021 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619709514;
        bh=uV4pH8bW9rxeLWB3WXO/T+5i0gmgm4sBbiw2Lm7Jk0Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tnUPevTboJ6pYRb+MA1Gg+Cwq7LE06m5gIUW1X8Eu33WMQsjuzyWewG+kDI2WTgHA
         d10dQueou/p4WSDTdbxoOaQkanf4t4pS+bw1DeEkQK6kDQ5sMsqurlm+JKfyN1WWMb
         OMjPqupiusTVovVcLGZDWkiVeNk0IZjjIUX0hAyNZxWgdM6N1VMqAjrZ+IhUjwIQXX
         ok/BWop+hb1dedpWjmJYqMFN0gtd3ts9pheVuxcg79dc+mPtLaXOYDYW1GDx4XgCEq
         0YytVTI/Se8/FB4/jq0LFeBy7qgO1XkA8LTRdWCp/UT9g5j/NFgYwpncoZokzAxmOD
         8SwiKUDNfbBWQ==
Received: by mail-qt1-f175.google.com with SMTP id a18so25608351qtj.10;
        Thu, 29 Apr 2021 08:18:33 -0700 (PDT)
X-Gm-Message-State: AOAM533NP3zNARaoPDL98Ds9S3l/4HKCXTAXpeFDlkqqPlWiNIQcfnOL
        N4uDxAKaoIb+fCuhjQukon8u7IDxavQvFUsMfw==
X-Google-Smtp-Source: ABdhPJyvnKfB3Mjs6tNMy27mCpJHlNiYu6wPEX1WAGi/QlDuZ7Ax+59Z4uCOBrNhOuO71QhBlF9qwe23+IqDNDTWkTY=
X-Received: by 2002:ac8:48c2:: with SMTP id l2mr10939431qtr.134.1619709512977;
 Thu, 29 Apr 2021 08:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org> <20210414083820.GH4869@dell>
 <CAL_JsqKYQ2EBgQJzKJSy-+D20Pmu_mzUQog03nAw=_PRY-uRjg@mail.gmail.com> <YHnisFroaR1qWA0Y@piout.net>
In-Reply-To: <YHnisFroaR1qWA0Y@piout.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 29 Apr 2021 10:18:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKO12CuA3MdX6bpENVYaT-0Xvm2L0S9UquHx2P-AhgiZQ@mail.gmail.com>
Message-ID: <CAL_JsqKO12CuA3MdX6bpENVYaT-0Xvm2L0S9UquHx2P-AhgiZQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
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

On Fri, Apr 16, 2021 at 2:17 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 16/04/2021 12:20:30-0500, Rob Herring wrote:
> > On Wed, Apr 14, 2021 at 3:38 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Fri, 09 Apr 2021, satya priya wrote:
> > >
> > > > Convert pm8xxx bindings from .txt to .yaml format. Also,
> > > > split this binding into two: parent binding(qcom-pm8xxx.yaml)
> > > > and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> > > >
> > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > ---
> > > > Changes in V2:
> > > >  - As per Bjorn's comments, I've split this into two, one parent binding
> > > >    and one child node rtc binding.
> > > >  - Fixed bot errors and changed maintainer name.
> > > >
> > > >  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
> > > >  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
> > > >  2 files changed, 54 insertions(+), 100 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > >
> > > Applied, thanks.
> >
> > You need to apply the rtc schema too. linux-next has an error on this one now.
> >
>
> I'm going to apply it later tonight

I've said this before, but MFD bindings with more than one schema file
like this one need to go thru one tree or things break temporarily (as
now Linus' tree is broken).

Rob
