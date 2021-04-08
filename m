Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F69358723
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 16:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbhDHO3B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Apr 2021 10:29:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231659AbhDHO3B (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 8 Apr 2021 10:29:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D91EE6113D;
        Thu,  8 Apr 2021 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617892130;
        bh=2FuIUpNq5FIFplx4EeFCO4ieAf4OaROCW1udvxA38HM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q4+2HCpcV+rS5tQbc0ehHIFcU43mYM92ygvDGNdO61ec7U7uxl6z/g5VUuCahu1d7
         tclDT/WHqPdalS2H/kvCw59rIEj1o0/NyKCgLxrewa2mIEtUgBjdtsKK2x81FzjliN
         uw+jo1d/K4o/DLj5Xy+jU/mH+yercmiEO/1QVp6bBQaQnRHe+J7+YaOT0+95DCEF+J
         cASgDaHb2prTzoCruYIXU+2JIyHemzG79APBJ3AyPtiBdDo1GAWEuaaV3V/Ci1JOum
         qSBa6ANdwyb4B26pLZ/tFa1b2RZBtpfnmixCCsdP9XolNJxUCMuBNpZeja4RZb/2Cn
         Zh+P3eorDIV0Q==
Received: by mail-ed1-f53.google.com with SMTP id f8so2657838edd.11;
        Thu, 08 Apr 2021 07:28:49 -0700 (PDT)
X-Gm-Message-State: AOAM532z3GWc8H9CFlDJGH3d7jyujc0DqC59rp/ImRAtx8Cvm6NAG0jB
        ooKDuKv1w3VGCXYww3Xikj0LyN33OXpSa/Dwyw==
X-Google-Smtp-Source: ABdhPJz4i8EdGJ6gG+z3e0xfEVwHZQEAJpCAY2QsFcp9e1muisyWgXQMDwqQbL0LT7UVpYYGYEQjULRMZIZcSo7sitA=
X-Received: by 2002:a50:fd12:: with SMTP id i18mr6127269eds.137.1617892128439;
 Thu, 08 Apr 2021 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <1615447798-6959-1-git-send-email-skakit@codeaurora.org>
 <1615447798-6959-3-git-send-email-skakit@codeaurora.org> <YEpNV55KR2nlAXMP@builder.lan>
 <86f8d5dbdb8d5d6627b9deece1978d07@codeaurora.org> <20210408023656.GM904837@yoga>
In-Reply-To: <20210408023656.GM904837@yoga>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 8 Apr 2021 09:28:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXaeuWPDAH30p_DKqkLm+tru8N8kqsgLaT1Y6pr6k-Lw@mail.gmail.com>
Message-ID: <CAL_JsqJXaeuWPDAH30p_DKqkLm+tru8N8kqsgLaT1Y6pr6k-Lw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: Convert pm8xxx bindings to yaml
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     satya priya <skakit@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Apr 7, 2021 at 9:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 07 Apr 10:37 CDT 2021, skakit@codeaurora.org wrote:
>
> > Hi Bjorn,
> >
> > On 2021-03-11 22:33, Bjorn Andersson wrote:
> > > On Thu 11 Mar 01:29 CST 2021, satya priya wrote:
> [..]
> > > > +patternProperties:
> > > > +  "rtc@[0-9a-f]+$":
> > >
> > > Can we somehow link this to individual binding docs instead of listing
> > > all the possible functions here?
> > >
> >
> > you mean we should split this into two:
> > qcom-pm8xxx.yaml and qcom-pm8xxx-rtc.yaml
> > Please correct me if wrong.
> >
>
> Right, I'm worried that it will be quite hard to maintain this document
> once we start adding all the various pmic blocks to it. So if we somehow
> can maintain a series of qcom-pm8xxx-<func>.yaml and just ref them into
> the main PMIC definition.
>
> @Rob, can you give us some guidance on how to structure this binding,
> with the various PMICs described will have some defined subset of a
> larger set of hardware blocks that's often shared between versions?

How you suggest is good. The only other thing is just 1 complete
example rather than a bunch of <func> fragments.

Rob
