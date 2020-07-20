Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B01225E82
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 14:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgGTM2K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 08:28:10 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:16083 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgGTM2K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Jul 2020 08:28:10 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 02238240006;
        Mon, 20 Jul 2020 12:28:05 +0000 (UTC)
Date:   Mon, 20 Jul 2020 14:28:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Message-ID: <20200720122805.GH3428@piout.net>
References: <HK2PR01MB32811CE9FE5DB463A69E94C8FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200720102629.GE3428@piout.net>
 <HK2PR01MB3281AE06720A1C7013603B07FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB3281AE06720A1C7013603B07FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/07/2020 10:44:41+0000, Johnson CH Chen (陳昭勳) wrote:
> Hi Alexandre,
> 
> > > v4->v5:
> > > - Fix reported build error by replacing RTC_DRV_DS1374_WDT with
> > > WATCHDOG_CORE
> > >
> > 
> > This is not the correct solution as this will remove the alarm functionality for
> > anyone enabling WATCHDOG. I already submitted a proper fix.
> > 
> 
> It's an appropriate and better solution. Thanks!
> 
> RTC_DRV_DS1374_WDT still should select WATCHDOG_CORE to avoid build error if WATCHDOG_CORE is set to "m", and it should be depended on RTC_DRV_DS1374 and WATCHDOG.
> 

My patch handles that properly, RTC_DRV_DS1374_WDT still selects WATCHDOG_CORE


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
