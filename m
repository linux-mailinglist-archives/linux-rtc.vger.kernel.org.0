Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32960324168
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Feb 2021 17:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbhBXPzv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Feb 2021 10:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbhBXP0P (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Feb 2021 10:26:15 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBB1C061574;
        Wed, 24 Feb 2021 07:25:32 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id l133so2762674oib.4;
        Wed, 24 Feb 2021 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PKMBgyiQ3hDdl7FbPyDOO9Us6EgKa0GCpWs3TRxqYBQ=;
        b=lBcYlcVBOrlhGx/QHSj530pPTtynhE6eKADo+KQDEfgoLH3E4i27/M0KHXblMnDEf2
         q4yJRoCF/PvZCJmeNhaUra0LLRicYwqV9+7MO3CebD0K9fekfmk/OgNBBFTzSF96bDDh
         KHx/UbtaNDRjq6SRjP1ieDbncN54WQFtpQoy4YOI9cCBCCygbToeleTFuYNBC0Y7UN/e
         FyqEJNfknxIuNg32vf6yimH10bRYNXpNov1YYE1Mzxns7D7wnyrqyqIpADNuC8O0WoaW
         3fjT68fRTCBVbVLF71hlPDW8VCBYKog1Fc1Jxkcyhu65LiFuTN9k2NuoVpr1/hdAbtOV
         +aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PKMBgyiQ3hDdl7FbPyDOO9Us6EgKa0GCpWs3TRxqYBQ=;
        b=R0FcEg0/bjXW5darHU7nxxRQxnT5fXyg+xik86fGJyjLRZlBky2ztGWyYqvi/4UUS4
         7Bfkjk2RFmUS6C93MA9IOFINcFUxouIx1NiXqWRoGdIY8upFXmOSyl2pyxz2RyhSLabH
         KWRSjN+eLcpcJLH+Mc6GxI2WeoLrx7nwjTLebVN1NAXSMApoTb4tQ1U8wKTo3MbaNmmp
         SwvCqmER4VrsquqPhhi5WaoHhOOzsqqwo3hB2AxCLK3EGMWLxsUhUJrKp0Ex3ErmF+Dq
         IrDXoCfkwVKPYXtd3aLEmarC6nXF1FyLdBe/O/mnmJL+GSfTKrmtuvhkePpx4tU4lU3X
         Gm8g==
X-Gm-Message-State: AOAM5305pzL4j6VQhZlJeClZP2CrbL4oy1RCBMW7Es3TBLxEvfC2Fcec
        v9vvr1LY+uEplCf7xQtsFUWIUgMT9lA=
X-Google-Smtp-Source: ABdhPJyidE9YuERxBbuFixruSokWU5RV/sXMQ+TmXxzQiiS3vKJOQTcnaILEuAlLopArrHxVtvauAA==
X-Received: by 2002:aca:1119:: with SMTP id 25mr3070505oir.156.1614180331649;
        Wed, 24 Feb 2021 07:25:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e72sm425303ote.26.2021.02.24.07.25.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 07:25:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Feb 2021 07:25:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Lars Alex Pedersen <laa@kamstrup.com>,
        Bruno Thomsen <bth@kamstrup.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: watchdog: pcf2127: systemd fails on 5.11
Message-ID: <20210224152529.GA242356@roeck-us.net>
References: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
 <20210222224325.GB177866@roeck-us.net>
 <CAH+2xPDDiUxKk3Y3R=fj0cOU+7vJRSC5yUb_XmfOUXnqoe+2Zg@mail.gmail.com>
 <YDZp/u+fO/8HX8qo@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YDZp/u+fO/8HX8qo@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Feb 24, 2021 at 04:00:14PM +0100, Alexandre Belloni wrote:
> Hi,
> 
> On 24/02/2021 15:55:00+0100, Bruno Thomsen wrote:
> > You could be right about that, I don't think the watchdog feature should
> > be available for use if the alarm feature is enabled due to how CTRL2
> > register behaves.
> > 
> > The hardware I am testing on is a custom board, but it's actually
> > possible to get a Raspberry Pi module called RasClock that has
> > the chip.
> > 
> 
> I have an eval board for the PCF2127 (and PCF2129), the OM13513.
> 
> > I will test some locking around WD_VAL register access as that is used
> > in pcf2127_wdt_ping function.
> > 
> > My initial test shows that spin_lock_irqsave around regmap calls are not
> > a good idea as it result in:
> > BUG: scheduling while atomic: watchdog/70/0x00000002
> > BUG: scheduling while atomic: systemd/1/0x00000002
> > 
> 
> The issue is not only regmap but the fact that i2C and spi accesses are
> allowed to sleep.
> 
Correct, those would have to be mutexes.

Thanks,
Guenter
