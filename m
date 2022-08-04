Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8755758A026
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Aug 2022 20:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239585AbiHDSD6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Aug 2022 14:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiHDSD6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 Aug 2022 14:03:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475BE1EC4B;
        Thu,  4 Aug 2022 11:03:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D5D7A615A5;
        Thu,  4 Aug 2022 18:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40146C433B5;
        Thu,  4 Aug 2022 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659636236;
        bh=MYvar+RB8d8gaQ5k8AOlYzIwc6GZaOiEmrr5hg1Qdf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pj2GxrEokLmfmcpRUg5BQQTnPUwA4OC7zwilnGvod59DLx13/5/8IjiEYHcYcRUGd
         p7y3mv7CqmfS5dtel2qCqQK3uMiJRCVjfZKY99nkt88HQ+Gu2mZ5+0KbfZjPf+3GNV
         9LQHLI2p4zlCDp8ZThMVRZV5Y3p/2FfCX8gv13b2qqZiySe8K5TbWvJwWZPzVSjjRq
         QDVj0LZPhIS1q05D/aV8oaYkEwASYH98EDj+iToIUWkLEuqS/fD0nZ60DKQtYIy/y1
         ecwLVG5DWYsBXg5FmIFRTzrG/22f9hV2AREwE/ug8mKB0121WXbv6IprvbBD+zUau1
         C77zZVzlHXpTA==
Received: by mail-vs1-f54.google.com with SMTP id q15so276692vsr.0;
        Thu, 04 Aug 2022 11:03:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo3E0JXSSi1Dx5mfZSZHz557QVcedx5f4sHpOg8KZtmR+cBuEo9U
        pvYqXe6CyYmPq2T5YMDDzPU3Fch0nlGNDokqmA==
X-Google-Smtp-Source: AA6agR69cRryiAwhAsieD+8r8oKzDjfeK3Ow5501lanm4SG7tcgmP4MG9TxOFY29wRJIWFs1+bvO0Bjr5+J8OMKbQB4=
X-Received: by 2002:a67:a246:0:b0:388:7e82:1d80 with SMTP id
 t6-20020a67a246000000b003887e821d80mr206218vsh.26.1659636235156; Thu, 04 Aug
 2022 11:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
 <20220721213732.GA1993841-robh@kernel.org> <YtrKofy+cZBQDRq3@mail.local>
In-Reply-To: <YtrKofy+cZBQDRq3@mail.local>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 4 Aug 2022 12:03:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJhf32tJAfjO5Go1gmt_yoasoGg+i8rtc-ADWLRfFtfSQ@mail.gmail.com>
Message-ID: <CAL_JsqJhf32tJAfjO5Go1gmt_yoasoGg+i8rtc-ADWLRfFtfSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jul 22, 2022 at 10:04 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 21/07/2022 15:37:32-0600, Rob Herring wrote:
> > On Fri, 17 Jun 2022 13:44:19 +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Convert the DS1307 (and compatible) RTC bindings from the free-form text
> > > format to json-schema.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - add compatible string list for [ st,m41t00, dallas,ds1338 ]
> > > - allow second interrupt and interrupt-names
> > > - remove commented-out section
> > > - allow vcc-supply
> > >
> > >  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
> > >  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 102 ++++++++++++++++++
> > >  2 files changed, 102 insertions(+), 52 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> > >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> > >
> >
> > Looks like this hasn't been picked up so I've applied both patches,
> > thanks!
>
> This was on my radar but I'm never sure what you prefer for dt-bindings
> only series.

My (or Krzysztof's) Reviewed-by/Acked-by means I expect it to go via
subsystem tree.

Rob
