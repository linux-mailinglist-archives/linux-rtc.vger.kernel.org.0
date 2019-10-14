Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58ECD668E
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2019 17:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbfJNPvj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Oct 2019 11:51:39 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:39345 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbfJNPvj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Oct 2019 11:51:39 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2F121240016;
        Mon, 14 Oct 2019 15:51:37 +0000 (UTC)
Date:   Mon, 14 Oct 2019 17:51:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: ds1685: use devm_platform_ioremap_resource
 helper
Message-ID: <20191014155136.GU3125@piout.net>
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
 <20191011150546.9186-2-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011150546.9186-2-tbogendoerfer@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/10/2019 17:05:44+0200, Thomas Bogendoerfer wrote:
> Simplify ioremapping of registers by using devm_platform_ioremap_resource.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  drivers/rtc/rtc-ds1685.c   | 23 +++--------------------
>  include/linux/rtc/ds1685.h |  1 -
>  2 files changed, 3 insertions(+), 21 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
