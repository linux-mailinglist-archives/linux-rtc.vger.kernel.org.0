Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963B83C2BE8
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 02:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhGJAKZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 20:10:25 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:32877 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGJAKZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 20:10:25 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 31473240007;
        Sat, 10 Jul 2021 00:07:40 +0000 (UTC)
Date:   Sat, 10 Jul 2021 02:07:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anatoly Pugachev <matorola@gmail.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc-test: invalid alarm value
Message-ID: <YOjky14Vfx7cbl85@piout.net>
References: <CADxRZqxLy3TxY4Qz1CXFxYLmWjbDvKULUnyGaQ2dChD+oe3DDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADxRZqxLy3TxY4Qz1CXFxYLmWjbDvKULUnyGaQ2dChD+oe3DDg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 30/06/2021 14:37:23+0300, Anatoly Pugachev wrote:
> Hello!
> 
> Getting the following on kernel boot:
> 
> $ journalctl -b -k --no-hostname --utc
> ...
> Jun 30 11:17:24 kernel: rtc-sun4v rtc-sun4v: registered as rtc0
> Jun 30 11:17:24 kernel: rtc-sun4v rtc-sun4v: setting system clock to
> 2021-06-30T11:17:14 UTC (1625051834)
> Jun 30 11:17:24 kernel: rtc-test rtc-test.0: registered as rtc1
> Jun 30 11:17:24 kernel: rtc rtc2: invalid alarm value:
> 18446744073704833233-01-06T00:54:29
> Jun 30 11:17:24 kernel: rtc-test rtc-test.1: registered as rtc2
> Jun 30 11:17:24 kernel: rtc rtc3: invalid alarm value:
> 18446744073704833233-01-06T00:54:29
> Jun 30 11:17:24 kernel: rtc-test rtc-test.2: registered as rtc3
> 
> Does it look correct? And if not, how should it work?
> 

rtc-test is not meant to be used in production, it will not work on boot
and the message is expected. I guess the best action would be to simply
disable it.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
