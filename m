Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82EB210573F
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2019 17:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUQjr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Nov 2019 11:39:47 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42269 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfKUQjr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Nov 2019 11:39:47 -0500
X-Originating-IP: 92.184.116.164
Received: from localhost (unknown [92.184.116.164])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5F7B224000A;
        Thu, 21 Nov 2019 16:39:45 +0000 (UTC)
Date:   Thu, 21 Nov 2019 17:39:41 +0100
From:   Alexandre Belloni <alexandre.belloni@free-electrons.com>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>, kernel@pengutronix.de
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
Message-ID: <20191121161303.GD299836@piout.net>
References: <20190905130336.10651-1-marex@denx.de>
 <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
 <ed1ef0a9-ff99-f986-8b9a-e2329bc82761@denx.de>
 <55288b3f-64e6-7ddb-3bcb-3418c976c59c@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55288b3f-64e6-7ddb-3bcb-3418c976c59c@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2019 09:21:49+0100, Bastian Krause wrote:
> 
> On 11/21/19 9:14 AM, Marek Vasut wrote:
> > On 11/21/19 9:09 AM, Bastian Krause wrote:
> >> On 9/5/19 3:03 PM, Marek Vasut wrote:
> >>> The battery backup can be disabled on this RTC, e.g. if populated right
> >>> out of production. Force the battery backup bit on to enable it.
> >>>
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>> Cc: Arnaud Ebalard <arno@natisbad.org>
> >>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> >>> Cc: Bastian Krause <bst@pengutronix.de>
> >>
> >> Reviewed-by: Bastian Krause <bst@pengutronix.de>
> >>
> > 
> > I recall there was some comment about setting BIT(5) as well,
> > RX8130_REG_CONTROL1_CHGEN , can you check that ?
> 
> RX8130_REG_CONTROL1_CHGEN decides whether the battery or the supercap
> should be charged or not. I think this patch is okay as is. I'll send a
> follow-up patch which will set RX8130_REG_CONTROL1_CHGEN depending on a
> new dt-binding "epson,backup-battery-chargeable" once this one is applied.
> 

You need to have a generic RTC property, either reuse
trickle-diode-disable (I know the name is a bit unfortunate but that is
waht we have) or have a new property stating that the auxiliary voltage
is chargeable. using battery in the name is probably not wise because
this may as well be a supercap.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
