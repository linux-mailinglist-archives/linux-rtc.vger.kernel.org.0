Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD6E36E02F
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 22:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbhD1UUz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 16:20:55 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60653 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241851AbhD1UUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 16:20:55 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3B541240008;
        Wed, 28 Apr 2021 20:20:07 +0000 (UTC)
Date:   Wed, 28 Apr 2021 22:20:06 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     youling257 <youling257@gmail.com>
Cc:     hdegoede@redhat.com, a.zummo@towertech.it,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/17] rtc: cmos: remove cmos_rtc_ops_no_alarm
Message-ID: <YInDdgd2r1SDdv4k@piout.net>
References: <20210110231752.1418816-5-alexandre.belloni@bootlin.com>
 <20210428184946.23999-1-youling257@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428184946.23999-1-youling257@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 29/04/2021 02:49:46+0800, youling257 wrote:
> this patch cause suspend failed on my Bay trail z3735f tablet.
> 
> [  162.038713] PM: dpm_run_callback(): platform_pm_suspend+0x0/0x40 returns -22
> [  162.038760] alarmtimer alarmtimer.0.auto: PM: failed to suspend: error -22

I think I know what is happening, there is one patch I wanted to send
this cycle but didn't, can you test it?

https://github.com/alexandrebelloni/linux/commit/50641a5a19cedf7561410d7db614da46c228bacc

Thanks for the report!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
