Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE5364CED
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Apr 2021 23:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhDSVQ1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Apr 2021 17:16:27 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55541 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhDSVQ0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Apr 2021 17:16:26 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8453A240003;
        Mon, 19 Apr 2021 21:15:54 +0000 (UTC)
Date:   Mon, 19 Apr 2021 23:15:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Gervais, Francois" <FGervais@distech-controls.com>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Michael McCormick <michael.mccormick@enatel.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] rtc: pcf85063: add integrity check
Message-ID: <YH3zCjPBk/aRn/jg@piout.net>
References: <20210311174940.23072-1-fgervais@distech-controls.com>
 <YHoKQ9qtupDhXVm3@piout.net>
 <SN6PR01MB4269E7C0A5B2069F96384A6BF3499@SN6PR01MB4269.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR01MB4269E7C0A5B2069F96384A6BF3499@SN6PR01MB4269.prod.exchangelabs.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/04/2021 20:26:42+0000, Gervais, Francois wrote:
> > I'm not sure I get the use case because PCF85063_REG_CTRL2 should be
> > initialized properly after the driver is probed anyway. The other two
> > can be set from userspace once it detects the oscillator failure which
> > would be better at deciding the policy anyway.
> 
> Thank you for the feedback I think I understand now.
> 
> We saw the reported problem on devices running kernel v5.4 which doesn't
> have the common clock framework support and so PCF85063_REG_CTRL2
> clkout was not initialized by the kernel and left at hardware default.
> 
> I guess with CCF support, if PCF85063_REG_CTRL2 gets corrupted on
> power application, on driver probe the clkout value will be set to 0b000
> or some known default.
> 
> I'm not familiar the CCF, do you know if it's the case that default values
> will be set on boot?

The CCF will disable any clocks that are not used on boot so the clock
will be either used and configured or not used and disabled.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
