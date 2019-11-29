Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFF610D2D3
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 09:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfK2IzH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 03:55:07 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54355 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfK2IzH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Nov 2019 03:55:07 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D64D020004;
        Fri, 29 Nov 2019 08:55:03 +0000 (UTC)
Date:   Fri, 29 Nov 2019 09:55:00 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/5] rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver
Message-ID: <20191129085500.GV299836@piout.net>
References: <20191031213835.11390-1-andreas@kemnade.info>
 <20191031213835.11390-6-andreas@kemnade.info>
 <20191128105751.GM299836@piout.net>
 <20191129075940.3b1c2631@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129075940.3b1c2631@kemnade.info>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/11/2019 07:59:40+0100, Andreas Kemnade wrote:
> > > +	/* disable interrupt */
> > > +	err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > > +	if (err)
> > > +		return err;  
> > 
> > Is it really useful to disable the alarm to reenable them later?
> > 
> Well, yes, seems to be nonsense.
> Am I right that I do not need to prevent alarm irqs between
> alloc() and register()?
> 

That's fine, the core will be ready to handle alarms after alloc()


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
