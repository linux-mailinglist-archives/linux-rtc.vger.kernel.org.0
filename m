Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD758C8CF6
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Oct 2019 17:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfJBPeN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Oct 2019 11:34:13 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40423 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfJBPeN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Oct 2019 11:34:13 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1635E20006;
        Wed,  2 Oct 2019 15:34:10 +0000 (UTC)
Date:   Wed, 2 Oct 2019 17:34:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Torokhov <dtor@google.com>
Cc:     Nick Crews <ncrews@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, enric.balletbo@collabora.com,
        Benson Leung <bleung@chromium.org>, dlaurie@chromium.org,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v3] rtc: wilco-ec: Handle reading invalid times
Message-ID: <20191002153410.GO4106@piout.net>
References: <20190925203209.79941-1-ncrews@chromium.org>
 <20191001195342.GH4106@piout.net>
 <CAE_wzQ8ugGgRsjfQwfncxhmy4EDOxKdoNm8CJ5AF=Mc5N6X7WQ@mail.gmail.com>
 <20191002103236.GM4106@piout.net>
 <CAE_wzQ9AodXUEANpDEQM+VYMVuxWmLoF0_1k-m5HdAfx+=01-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE_wzQ9AodXUEANpDEQM+VYMVuxWmLoF0_1k-m5HdAfx+=01-A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/10/2019 08:20:34-0700, Dmitry Torokhov wrote:
> > I'm still not convinced it is useful to have an error in dmesg when the
> > time is invalid, as long as userspace knows it is invalid. What is the
> > course of action for the end user when that happens?
> 
> Report it, or, in our case, we will see it in the feedback logs.
> However I do agree that it is not the best option, even if we report
> error to userspace I am not sure if it will handle it properly. What
> userspace is supposed to do when presented with -EIO or similar?
> 

I would say probably retry a few times if it gets -EIO and simply abort
in case of -EINVAL. I'm not aware of any userspace tool behaving that
way though. They all simply abort.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
