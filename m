Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CECF320BF
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Jun 2019 23:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFAVOZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Jun 2019 17:14:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:32957 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAVOZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 Jun 2019 17:14:25 -0400
X-Originating-IP: 82.246.155.60
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C32D2E0007;
        Sat,  1 Jun 2019 21:14:22 +0000 (UTC)
Date:   Sat, 1 Jun 2019 23:14:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: tps65910: fix typo in register name in read_alarm()
Message-ID: <20190601211421.GD3558@piout.net>
References: <eb17700717eee62e2aa7c8c98c5052941dc6e5d3.1558775021.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb17700717eee62e2aa7c8c98c5052941dc6e5d3.1558775021.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/05/2019 11:12:55+0200, Michał Mirosław wrote:
> Fix an obvious typo: in read_alarm() call we should read alarm setting
> (starting at ALARM_SECONDS register) and not current time.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/rtc/rtc-tps65910.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
