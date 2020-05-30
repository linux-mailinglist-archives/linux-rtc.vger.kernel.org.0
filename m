Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672ED1E938E
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 22:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgE3UZI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 30 May 2020 16:25:08 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50585 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgE3UZI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 30 May 2020 16:25:08 -0400
X-Originating-IP: 176.184.63.162
Received: from localhost (eab95-h01-176-184-63-162.dsl.sta.abo.bbox.fr [176.184.63.162])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C6D6F1BF206;
        Sat, 30 May 2020 20:25:05 +0000 (UTC)
Date:   Sat, 30 May 2020 22:25:03 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: abx80x: RV-1805 initialization order correct?
Message-ID: <20200530202503.GB316755@piout.net>
References: <CAE+UdorayxG79wDW8Up6-O_LdoBvcqQNQ4yYM90n2kv+XAu4+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE+UdorayxG79wDW8Up6-O_LdoBvcqQNQ4yYM90n2kv+XAu4+g@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 29/05/2020 07:13:00-0400, Kevin P. Fleming wrote:
> The driver has a block of RV-1805-specific code (under the comment
> 'Configure RV1805 specifics'), which is executed before the part
> autodetection code (under the comment 'part autodetection').
> 
> If the driver is loaded with the 'generic' device data for abx80x, and
> the actual part in use is an RV-1805, the part-specific code won't be
> executed. I'm using this driver in a dynamic Device Tree environment,
> and at the moment I can't specify the part as the driver is loaded
> (although I could modify the overlay to support that if required).
> 
> So the question is: does the RV-1805 specific code *have* to be
> executed before part autodetection in order to avoid the lockup
> situation mentioned in the comments, or could it be moved immediately
> after the autodetection so that it will be always be executed for an
> RV-1805 part?

You can't detect the difference between the rv1805 and the ab1805 with
the id registers as both have 0x1805 so you will always have to use the
correct compatible string for it. The position of the code doesn't
matter.

Basically, the autodetection should never be used as the device tree
must describe the actual hardware. My point of view is that this was a
mistake to have it in the driver in the first place.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
