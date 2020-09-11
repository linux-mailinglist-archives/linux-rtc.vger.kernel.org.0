Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9BA26639F
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 18:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgIKQVI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 12:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgIKPaa (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:30:30 -0400
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D6E321D7E;
        Fri, 11 Sep 2020 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599833002;
        bh=FVUBrBUew4OrNTC+wXrBugVz5+Ee1tqB5139mrISZUs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZP4GPYsL0ABFoO/JQ1fpmbTARh9KmtMzHIuPGGVVrz7JTuRAdD95eeTqVsQ1OqEoA
         wr70uCma1J+ZPVrGIxnMulGcN82OdAB+Gck3toLSpKZIoZFTJgJRbtVLsHRjCzGlVk
         1bGvfXw76IYgyJzOsEqq656cqaM9N+d0eT1Xfko4=
Received: by mail-oo1-f41.google.com with SMTP id g26so2298414ooa.9;
        Fri, 11 Sep 2020 07:03:22 -0700 (PDT)
X-Gm-Message-State: AOAM5327qMydCgKVIL1kap2fymFutjb1K49lJrZodsK76SjkFDe0fKMT
        Knd4h7/jjVerV/rqWL6zEGRxFsGxWG4QutTAmA==
X-Google-Smtp-Source: ABdhPJxTuUQpAZ7VBRAgyuwv+5Jv+wLNqLOBvyESpzDLE3KgVTieiFkjstfCsDTOYHpY06twVE/mYAqaxnPss6ZklvY=
X-Received: by 2002:a4a:9d48:: with SMTP id f8mr1722615ook.50.1599833001875;
 Fri, 11 Sep 2020 07:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200827091441.12972-1-qiang.zhao@nxp.com> <20200909202456.GA3019412@bogus>
 <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 11 Sep 2020 08:03:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
Message-ID: <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for nxp,rtc-2127.txt
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Sep 9, 2020 at 9:16 PM Qiang Zhao <qiang.zhao@nxp.com> wrote:
>
> On Thu, Sep 10, 2020 at 04:25AM, Rob Herring <robh@kernel.org> wrote:
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 2020=E5=B9=B49=E6=9C=8810=E6=97=A5 4:25
> > To: Qiang Zhao <qiang.zhao@nxp.com>
> > Cc: a.zummo@towertech.it; alexandre.belloni@bootlin.com;
> > linux-rtc@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
> > nxp,rtc-2127.txt
> >
> > On Thu, Aug 27, 2020 at 05:14:39PM +0800, Qiang Zhao wrote:
> > > From: Zhao Qiang <qiang.zhao@nxp.com>
> > >
> > > Add bindings for nxp,rtc-2127
> > >
> > > Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt | 18
> > ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt
> >
> > Bindings should be in DT schema format now.
>
> Is there any doc description for DT schema format or example
> So that I can take as a reference. Thank you!

Documentation/devicetree/writing-schema.rst and about 1000 examples in
the kernel tree.

Rob
