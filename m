Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5077DD667F
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2019 17:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbfJNPuZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Oct 2019 11:50:25 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37739 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730000AbfJNPuY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Oct 2019 11:50:24 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 20BBD240018;
        Mon, 14 Oct 2019 15:50:22 +0000 (UTC)
Date:   Mon, 14 Oct 2019 17:50:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        enric.balletbo@collabora.com, bleung@chromium.org,
        dlaurie@chromium.org, djkurtz@chromium.org, dtor@google.com,
        campello@chromium.org
Subject: Re: [PATCH v4] rtc: wilco-ec: Handle reading invalid times
Message-ID: <20191014155021.GR3125@piout.net>
References: <20191004142608.170159-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004142608.170159-1-ncrews@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/10/2019 08:26:08-0600, Nick Crews wrote:
> If the RTC HW returns an invalid time, the rtc_year_days()
> call would crash. This patch adds error logging in this
> situation, and removes the tm_yday and tm_wday calculations.
> These fields should not be relied upon by userspace
> according to man rtc, and thus we don't need to calculate
> them.
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> ---
>  drivers/rtc/rtc-wilco-ec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
