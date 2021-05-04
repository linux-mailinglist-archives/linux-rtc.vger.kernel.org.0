Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7FD372CC7
	for <lists+linux-rtc@lfdr.de>; Tue,  4 May 2021 17:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhEDPMK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 May 2021 11:12:10 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54025 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhEDPMK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 May 2021 11:12:10 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AC30C1BF206;
        Tue,  4 May 2021 15:11:12 +0000 (UTC)
Date:   Tue, 4 May 2021 17:11:12 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <YJFkEFQHiwq4+7zQ@piout.net>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
 <20210414083820.GH4869@dell>
 <CAL_JsqKYQ2EBgQJzKJSy-+D20Pmu_mzUQog03nAw=_PRY-uRjg@mail.gmail.com>
 <YHnisFroaR1qWA0Y@piout.net>
 <CAL_JsqKO12CuA3MdX6bpENVYaT-0Xvm2L0S9UquHx2P-AhgiZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKO12CuA3MdX6bpENVYaT-0Xvm2L0S9UquHx2P-AhgiZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/04/2021 10:18:21-0500, Rob Herring wrote:
> On Fri, Apr 16, 2021 at 2:17 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi,
> >
> > On 16/04/2021 12:20:30-0500, Rob Herring wrote:
> > > On Wed, Apr 14, 2021 at 3:38 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > >
> > > > On Fri, 09 Apr 2021, satya priya wrote:
> > > >
> > > > > Convert pm8xxx bindings from .txt to .yaml format. Also,
> > > > > split this binding into two: parent binding(qcom-pm8xxx.yaml)
> > > > > and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> > > > >
> > > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > > ---
> > > > > Changes in V2:
> > > > >  - As per Bjorn's comments, I've split this into two, one parent binding
> > > > >    and one child node rtc binding.
> > > > >  - Fixed bot errors and changed maintainer name.
> > > > >
> > > > >  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
> > > > >  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
> > > > >  2 files changed, 54 insertions(+), 100 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> > > >
> > > > Applied, thanks.
> > >
> > > You need to apply the rtc schema too. linux-next has an error on this one now.
> > >
> >
> > I'm going to apply it later tonight
> 
> I've said this before, but MFD bindings with more than one schema file
> like this one need to go thru one tree or things break temporarily (as
> now Linus' tree is broken).
> 

Noted, I'll be more careful next time.

> Rob

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
