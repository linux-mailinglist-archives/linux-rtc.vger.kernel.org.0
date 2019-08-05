Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9FF81BA9
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 15:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbfHENQZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 09:16:25 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52835 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729582AbfHENQZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 09:16:25 -0400
X-Originating-IP: 82.246.155.60
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C99B71C000B;
        Mon,  5 Aug 2019 13:16:21 +0000 (UTC)
Date:   Mon, 5 Aug 2019 15:16:20 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     marcus.wolf@wolf-entwicklungen.de
Cc:     a.zummo@towertech.it, havasi@efr.de, linux-rtc@vger.kernel.org,
        b.spranger@linutronix.de
Subject: Re: RTC Epson Toyocom RX-8025T
Message-ID: <20190805131620.GE3600@piout.net>
References: <20190727084806.7DF892CE0139@dd39320.kasserver.com>
 <20190805130526.GD3600@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805130526.GD3600@piout.net>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/08/2019 15:05:29+0200, Alexandre Belloni wrote:
> > Would you like me to propose you the support for the RX-8025T as a separate
> > implementation - aka new driver?
> 
> I think that what you have is actually a RX-8801SA. Can you check that the
> register layout is the same? The datasheet is available here:
> 
> https://support.epson.biz/td/api/doc_check.php?dl=app_RX-8801SA&lang=en
> 

To elaborate, if this is the case, then the rv8803 should already work
properly.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
