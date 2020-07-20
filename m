Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072792259BD
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 10:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgGTIMg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 04:12:36 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55443 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgGTIMg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Jul 2020 04:12:36 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7688E1C000A;
        Mon, 20 Jul 2020 08:12:33 +0000 (UTC)
Date:   Mon, 20 Jul 2020 10:12:33 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Scott Wood <scottwood@freescale.com>
Subject: Re: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
Message-ID: <20200720081233.GD3428@piout.net>
References: <20200717214036.67fa5379@canb.auug.org.au>
 <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 17/07/2020 09:49:05-0700, Randy Dunlap wrote:
> on x86_64:
> # CONFIG_WATCHDOG is not set
> 
> ld: drivers/rtc/rtc-ds1374.o: in function `ds1374_probe':
> rtc-ds1374.c:(.text+0x736): undefined reference to `watchdog_init_timeout'
> ld: rtc-ds1374.c:(.text+0x77e): undefined reference to `devm_watchdog_register_device'
> 

Thanks, I fixed the CONFIG_WATCHDOG dependency now.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
