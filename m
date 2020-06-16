Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895241FBE11
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2020 20:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgFPSbb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jun 2020 14:31:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57869 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgFPSba (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Jun 2020 14:31:30 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AF3F6C0002;
        Tue, 16 Jun 2020 18:31:28 +0000 (UTC)
Date:   Tue, 16 Jun 2020 20:31:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: add alarm support
Message-ID: <20200616183128.GI241261@piout.net>
References: <20200616090254.GH241261@piout.net>
 <C3IJT2LEDYLY.2NK6MCEXUHZHA@atris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3IJT2LEDYLY.2NK6MCEXUHZHA@atris>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/06/2020 09:07:59-0400, Liam Beguin wrote:
> > It is generally not useful to have those debug strings anymore because
> > the core already provides tracepoints at the correct locations.
> > 
> > If you really want to keep it, then please use %ptR.
> > 
> > This is also valid for the other dev_dbg.
> > 
> 
> I'm not particularly attached to keeping these in. I just left them in
> since it seemed to be common in other rtc drivers.
> 

Yes, those predates the tracepoints (which are fairly recent).


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
