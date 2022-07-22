Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B020B57E40C
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Jul 2022 18:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiGVQEy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Jul 2022 12:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiGVQEx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Jul 2022 12:04:53 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21AA17E3C
        for <linux-rtc@vger.kernel.org>; Fri, 22 Jul 2022 09:04:51 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B817B240008;
        Fri, 22 Jul 2022 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658505890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HMTBZyJBu2qexNfv7BzuGD7ItuMgmoc699Ik31JwJh4=;
        b=W3NApy9oyxKJwhn9jHi4htglHhksEsvyuaiKwGrx/ZYeQyBc3BdC6VCJP2ZpeNfyw0z4MU
        0C7Wc6I5T0/TS29O/gLs/HPR0c3Qnbt3Fvoz7t1gumwLuycVOm93I8Vuo3QhM4ZLyGp3Lx
        G5sTHsYOEKDYJvzJ9lVe+G/jCse4raeKURk5p7llr4EEY0+/mmRL7QCMgkgStOVdDzo2fE
        6ON+A0S7pKO2JlYx5TWPsIt9zNtPlZUtnbTHfECvh8w11JCWoXttIv4WVDca7lke31QQiU
        +ZwPHW/MhnLB4/YQ2Ns8RkXXAZiXOKyTw0qsaCIrJ0KkJqet/ajWTzUnMSwwIg==
Date:   Fri, 22 Jul 2022 18:04:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Message-ID: <YtrKofy+cZBQDRq3@mail.local>
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
 <20220721213732.GA1993841-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721213732.GA1993841-robh@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 21/07/2022 15:37:32-0600, Rob Herring wrote:
> On Fri, 17 Jun 2022 13:44:19 +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Convert the DS1307 (and compatible) RTC bindings from the free-form text
> > format to json-schema.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - add compatible string list for [ st,m41t00, dallas,ds1338 ]
> > - allow second interrupt and interrupt-names
> > - remove commented-out section
> > - allow vcc-supply
> > 
> >  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
> >  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 102 ++++++++++++++++++
> >  2 files changed, 102 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> > 
> 
> Looks like this hasn't been picked up so I've applied both patches, 
> thanks!

This was on my radar but I'm never sure what you prefer for dt-bindings
only series.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
