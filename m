Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B89A72240
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2019 00:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfGWWUR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 18:20:17 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:60616 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbfGWWUQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 23 Jul 2019 18:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=HIvnfxBbZcM6S+9ovlZrUChMpebaPTCr8fSmrAQQ6xI=; b=pHIeIVzUDs3FGqTis7gR0Dgy9T
        irxna0+VpVvVhTuQiYTlsBy6j4N0LGWyZDOs9z97UmI4a/38xNaK5PxWQ4EhlD58PHrhl0AWewY7u
        pvbaaKEBqoUP6EQ0DD76W7XUWUEKzAaL90BZXCiqIdEHWnTCs4QxzD/kNzbYjw/loJsQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hq38n-0003pp-EH; Wed, 24 Jul 2019 00:20:13 +0200
Date:   Wed, 24 Jul 2019 00:20:13 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tbm@cyrius.com, Oliver Hartkopp <socketcan@hartkopp.net>,
        Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH] ARM: kirkwood: ts219: disable the SoC's RTC
Message-ID: <20190723222013.GD13517@lunn.ch>
References: <20190723194505.28060-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190723194505.28060-1-uwe@kleine-koenig.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jul 23, 2019 at 09:45:05PM +0200, Uwe Kleine-König wrote:
> The internal RTC doesn't work, loading the driver only yields
> 
> 	rtc-mv f1010300.rtc: internal RTC not ticking
> 
> . So disable it.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Hi Uwe

This should probably go via the mvebu maintainers, who look after the
DT files.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
