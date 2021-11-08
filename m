Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60894447C2C
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Nov 2021 09:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237474AbhKHIpl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Nov 2021 03:45:41 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42617 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237443AbhKHIpj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Nov 2021 03:45:39 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B71541C0009;
        Mon,  8 Nov 2021 08:42:53 +0000 (UTC)
Date:   Mon, 8 Nov 2021 09:42:53 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc-rv8803: fix writing back ctrl in flag register
Message-ID: <YYjjDW6WhBJqUGJD@piout.net>
References: <20211101013400.325855-1-dominique.martinet@atmark-techno.com>
 <YYiWq564QzQgTsqV@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYiWq564QzQgTsqV@atmark-techno.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/11/2021 12:16:59+0900, Dominique Martinet wrote:
> Hi Alexandre, Alessandro,
> 
> the other patch was proved to be unneeded, but this one is still a valid
> fix as far as I can understand the code (reusing RV8803_CTRL value to
> write into RV8803_FLAG does not look correct)
> 
> (I'm also convinced either mostly work because the original values are
> usually close enough, but that's not a reason to keep using the wrong
> one)
> 
> 
> Would you have time to take a look?

I did check with the initial review and I'm going to apply it, I just
didn't have the time to do that yet.

> 
> 
> Thanks!
> 
> Dominique Martinet wrote on Mon, Nov 01, 2021 at 10:33:59AM +0900:
> > ctrl is set from read_regs(..FLAG, 2, ctrl), so ctrl[0] is FLAG
> > and ctrl[1] is the CTRL register.
> > Use ctrl[0] to write back to the FLAG register as appropriate.
> > 
> > Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> > ---
> >  drivers/rtc/rtc-rv8803.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> > index 72adef5a5ebe..0d5ed38bf60c 100644
> > --- a/drivers/rtc/rtc-rv8803.c
> > +++ b/drivers/rtc/rtc-rv8803.c
> > @@ -340,8 +340,8 @@ static int rv8803_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> >  		}
> >  	}
> >  
> > -	ctrl[1] &= ~RV8803_FLAG_AF;
> > -	err = rv8803_write_reg(rv8803->client, RV8803_FLAG, ctrl[1]);
> > +	ctrl[0] &= ~RV8803_FLAG_AF;
> > +	err = rv8803_write_reg(rv8803->client, RV8803_FLAG, ctrl[0]);
> >  	mutex_unlock(&rv8803->flags_lock);
> >  	if (err)
> >  		return err;

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
