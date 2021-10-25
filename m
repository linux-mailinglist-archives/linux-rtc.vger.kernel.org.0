Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391E44393A5
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Oct 2021 12:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbhJYK2D (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Oct 2021 06:28:03 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39255 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhJYK2C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Oct 2021 06:28:02 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DF9A9C000B;
        Mon, 25 Oct 2021 10:25:38 +0000 (UTC)
Date:   Mon, 25 Oct 2021 12:25:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= 
        <d.mueller@elsoft.ch>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc-pcf8563: STOP bit usage during time update?
Message-ID: <YXaGIh3Y5vA66RWc@piout.net>
References: <43a688c4-f721-ce3f-f6fc-c1065cc12b68@elsoft.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43a688c4-f721-ce3f-f6fc-c1065cc12b68@elsoft.ch>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/09/2021 09:00:00+0200, David Müller (ELSOFT AG) wrote:
> According to the example on page 30 of the EPSON datasheet
> https://support.epson.biz/td/api/doc_check.php?dl=app_RTC-8564JE&lang=en
> for the 8564 version of this chip, the time update sequence is as follows:
> 
> - set CTRLSTS1[STOP] bit to 1
> - update time registers
> - set CTRLSTS1[STOP] bit to 0
> 
> The NXP datasheet is not so explicit regarding STOP bit handling.
> 
> Nevertheless I don't see any STOP bit related action in the driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-pcf8563.c?h=v5.14#n244
> 
> Am I overlooking or missing something here?

You are not missing anything, the driver is not stopping the clock while
updating it. The hym8563 driver (which is compatible) does it.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
