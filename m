Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0575FDA62D
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2019 09:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfJQHOk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Oct 2019 03:14:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55478 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731954AbfJQHOk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Oct 2019 03:14:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so1319906wma.5
        for <linux-rtc@vger.kernel.org>; Thu, 17 Oct 2019 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sjOmiSYuzMMV+1LmVtdqxL0iBZzQdBkGD8msyg4TZzA=;
        b=U5NXOxzipe6Sm4dvuNHy1bbAlxNR6i3G6AXcJoFHuK4x4DpjbWmpjG9wAf/kk57VwP
         vFzVY+0Sy6QRta4jrmLI4jzJeZxSI7TH5xYEv0XpUepoNUVp4158PE7S+mIWIfL78UOn
         x4XsYQBM32c9GjdXoxPODAEWGI0a6ClaPgoTbjmxe+qzQZ3FeVqChVumjEpHLoUVTlev
         vCktkOPmypsbZP4cWk4CIKPbSbRGSq8YLmW0+AS+a7Kj01mIVlf5AOiju0GG9Dm/lQQ9
         Wr12Zxj+rSCyySdTy+zabujeKBurcO0OGi5HFPYOWW/8ZoiU4TE25ACS+bXhLDMMAsa+
         LMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sjOmiSYuzMMV+1LmVtdqxL0iBZzQdBkGD8msyg4TZzA=;
        b=QLIgdCZsRvvdNbJ8gREmhLDoLkIoDoJQ7Z4pUjQxy0RzS4aGwJOhqmljR11zT30e2p
         zUFjfn94Ta4If6HMGNYE91iFC4EmCekiKP69M1hkBLZZx8Yva9QGlAoCoOvO/k+luSHJ
         mfBWp6Y3M90ZbH82YHzPNOAy7aWDrbsNYHvRSkZyGv5rVcj0hbVbP+WLxVARMIv4zS8w
         r0dJ9HPF9+N1IbAxZ0n8/bNxNyrOxaPJz6SOXbLoLx9/fLgvok0E2eBduQ/VPgnOcUM3
         A8u7ruEw3b8JWd/07HykNY1NXw0a7JGM6p7HJ6v4nqoLIpR2trEkgyzh68yWHvEnGcHZ
         ELxA==
X-Gm-Message-State: APjAAAXX2asZXWDgnJBDd8mlf3Ses2M6jIvGZKg4g4T8c8XqofjRM8+F
        kSkuNsvUwj5WQLLIw2Lpr1jK+Q==
X-Google-Smtp-Source: APXvYqyeNcmRYHZngtQtTdD0cPc/y8lTB9C1CXb6p9FdfbROYTVO8tNHzQNOw9g7MSgyyqDuMbeyXQ==
X-Received: by 2002:a05:600c:2054:: with SMTP id p20mr1612482wmg.76.1571296477846;
        Thu, 17 Oct 2019 00:14:37 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id c17sm1375764wrc.60.2019.10.17.00.14.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 00:14:37 -0700 (PDT)
Date:   Thu, 17 Oct 2019 08:14:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jakub Kicinski <jakub.kicinski@netronome.com>
Cc:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v10 4/6] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20191017071435.GI4365@dell>
References: <20191015120953.2597-1-tbogendoerfer@suse.de>
 <20191015120953.2597-5-tbogendoerfer@suse.de>
 <20191015122349.612a230b@cakuba.netronome.com>
 <20191016192321.c1ef8ea7c2533d6c8e1b98a2@suse.de>
 <20191016103813.24447c64@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191016103813.24447c64@cakuba.netronome.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 16 Oct 2019, Jakub Kicinski wrote:

> On Wed, 16 Oct 2019 19:23:21 +0200, Thomas Bogendoerfer wrote:
> > On Tue, 15 Oct 2019 12:23:49 -0700
> > Jakub Kicinski <jakub.kicinski@netronome.com> wrote:
> > 
> > > On Tue, 15 Oct 2019 14:09:49 +0200, Thomas Bogendoerfer wrote:  
> > > > SGI IOC3 chip has integrated ethernet, keyboard and mouse interface.
> > > > It also supports connecting a SuperIO chip for serial and parallel
> > > > interfaces. IOC3 is used inside various SGI systemboards and add-on
> > > > cards with different equipped external interfaces.
> > > > 
> > > > Support for ethernet and serial interfaces were implemented inside
> > > > the network driver. This patchset moves out the not network related
> > > > parts to a new MFD driver, which takes care of card detection,
> > > > setup of platform devices and interrupt distribution for the subdevices.
> > > > 
> > > > Serial portion: Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > > > 
> > > > Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>  
> > > 
> > > Looks good, I think.  
> > 
> > thank you. 
> > 
> > Now how do I get an Acked-by for the network part to merge it via
> > the MIPS tree ?
> 
> Oh, via the MIPS tree? It was quite unclear which these would land it,
> at least to an untrained mind like mine :) It could be useful to
> provide some info on how you want this merged and what you expect from
> whom in the cover letter in the future.
> 
> Hopefully Dave will be able to give you an official ack.

If this does go through the MIPS tree, I shall require a pull-request
to an immutable branch.  However, I'm happy to do that if everyone's
happen with it going in via MFD.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
