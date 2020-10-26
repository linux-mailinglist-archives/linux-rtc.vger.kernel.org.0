Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2022998BC
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Oct 2020 22:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733043AbgJZV3d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Oct 2020 17:29:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42206 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733019AbgJZV3c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Oct 2020 17:29:32 -0400
Received: by mail-ot1-f67.google.com with SMTP id h62so9334906oth.9;
        Mon, 26 Oct 2020 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=70oatzaSg8bxxmWOPeOnuHXCY727QGvpglybBnXvoPE=;
        b=U47BT3xmo/M18aD/HHFCUr8I+5CWNGR8pGE7v/FU7c2ptWS7OCfYzIesEAMnRIORoE
         56g7YO5QDj5TfD6r8oN/gcim4XYdNE+lponqZSXhe0xWM/ZkKHWZc10XUjujyCZbHN/h
         VU7vxs1cBrRWz6K2jIvG+lpwAp/DbCjiVQsiBoBB6+jqeKRyfkSaciw0Q8ieHFyxWsjT
         xSvtKOTuXYaDX4NjRF+oq6leESUliC69L9EWRPGWXlJ9r/sb8Ty2Y4J26Q01+O7U3gj/
         bHfrCDSINbEmz27L/cg/q4A382/WXfrXuEA7dfoKCF7GOyUj3dDmHEVJxeM+TOy3rQAw
         TlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=70oatzaSg8bxxmWOPeOnuHXCY727QGvpglybBnXvoPE=;
        b=L4ylhplVRHmSR4SmlSkEQ4MzmtNXK8TFMTru30Td/giQDWXBK6M4C0F0apZEL7kbM/
         RQuYQDtBnt73K1VJHZugyc9Bctn3MSPTbPGT5UI8q233T8blUE8myIGQwGYryuwmlmQt
         yfkMrPmrimnZg2Mz1ZgMvSag5BuyB7kHsSIdvpCxANmkew/3MSszsRxRbShtHZ6yxW6Z
         9sOsGOP7RJYXbZS6MLUEibQjOPvPspBK3im9bPOjqNEdZCJ0XEX+D6u0q/K9hWw5K4dp
         KezAyRMb1SA70nGeB2aRj/P1KvvP7Hwh3QYY0oGZt7sLQn/OKczOXwkOSFKf/IdKpxM5
         cYlQ==
X-Gm-Message-State: AOAM533LAjkbndTFhCDeu6fDBYvViP8+XL+8O+G1/G3Jtha8KEAOQ0qb
        CTUIOQyZmF6z63yOptUe5If7ig12+Kg=
X-Google-Smtp-Source: ABdhPJyRNZeUXYQ67LV5KVcPAl/1vIhrVluPakg6gVscaXsAuOKDwkCknlP5obXGD5ZhSsvmwCeomQ==
X-Received: by 2002:a05:6830:10d2:: with SMTP id z18mr12201380oto.41.1603747771591;
        Mon, 26 Oct 2020 14:29:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v22sm4903500oia.7.2020.10.26.14.29.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 14:29:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 26 Oct 2020 14:29:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Qiang Zhao <qiang.zhao@nxp.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly
 available
Message-ID: <20201026212930.GB113829@roeck-us.net>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <VE1PR04MB676864E851C6371F97877FA291190@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <20201026204811.GD75353@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026204811.GD75353@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Oct 26, 2020 at 09:48:11PM +0100, Alexandre Belloni wrote:
> On 26/10/2020 07:23:26+0000, Qiang Zhao wrote:
> > Any update for this patchset?
> > 
> 
> The whole point would be to get the DT and the watchdog maintainers
> agree on the property name. Once done, the driver implementation is
> trivial and will get applied.
> 

DT maintainers make that decision.

Guenter

> > Best Regards
> > Qiang Zhao
> > 
> > > -----Original Message-----
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > Sent: 2020年9月24日 18:53
> > > To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Qiang Zhao
> > > <qiang.zhao@nxp.com>; Bruno Thomsen <bruno.thomsen@gmail.com>
> > > Cc: linux-rtc@vger.kernel.org; a.zummo@towertech.it;
> > > linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; robh+dt@kernel.org; kernel@pengutronix.de;
> > > Wim Van Sebroeck <wim@linux-watchdog.org>; Guenter Roeck
> > > <linux@roeck-us.net>
> > > Subject: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly available
> > > 
> > > Hello,
> > > 
> > > now that there are two people stumbling over the pcf2127 driver providing a
> > > non-functional watchdog device, here comes an RFC patch to address this.
> > > 
> > > Note this is only compile tested and dt-documentation is still missing.
> > > Still send this series because the cleanup is nice independent of this discussion
> > > and to have something to argue about.
> > > 
> > > Does someone can offer a better name than "has-watchdog", is there a scheme
> > > that could be used already that I'm not aware of?
> > > 
> > > Best regards
> > > Uwe
> > > 
> > > Uwe Kleine-König (2):
> > >   rtc: pcf2127: move watchdog initialisation to a separate function
> > >   [RFC] rtc: pcf2127: only use watchdog when explicitly available
> > > 
> > >  drivers/rtc/rtc-pcf2127.c | 57 ++++++++++++++++++++++-----------------
> > >  1 file changed, 32 insertions(+), 25 deletions(-)
> > > 
> > > --
> > > 2.28.0
> > 
> 
> -- 
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
