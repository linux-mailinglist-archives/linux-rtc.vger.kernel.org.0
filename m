Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52CD6E26F2
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 01:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408017AbfJWXUI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Oct 2019 19:20:08 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58441 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404151AbfJWXUH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Oct 2019 19:20:07 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9E9D81C0002;
        Wed, 23 Oct 2019 23:20:04 +0000 (UTC)
Date:   Thu, 24 Oct 2019 01:20:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        Stephane Eranian <eranian@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
Message-ID: <20191023232004.GV3125@piout.net>
References: <20191023150311.844123-1-arnd@arndb.de>
 <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
 <20191023200135.GT3125@piout.net>
 <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/10/2019 21:30:29+0000, Luck, Tony wrote:
> >> rtc-efi rtc-efi: setting system clock to 2019-10-23T18:30:23 UTC (1571855423)
> 
> > You can remove CONFIG_RTC_HCTOSYS, this line will disappear, systemd
> > will not like that but efirtc was not setting the system time anyway so
> > this shouldn't change the behaviour.
> 
> 
> Wait ... that message says "setting system clock"
> 
> but then you say " efirtc was not setting the system time anyway".
> 
> So did the time get set, or not?
> 
> If it wasn't set, why does the message say that it was set?
> 

What I meant was that drivers/char/efirtc.c was not setting the system
time but when using drivers/rtc/rtc-efi.c with CONFIG_RTC_HCTOSYS, the
kernel will use the rtc to set the system time.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
