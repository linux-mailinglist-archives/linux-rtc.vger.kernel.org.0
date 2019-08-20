Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB3A969AF
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Aug 2019 21:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbfHTTrS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Aug 2019 15:47:18 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:57505 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTTrS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Aug 2019 15:47:18 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0833D240005;
        Tue, 20 Aug 2019 19:47:14 +0000 (UTC)
Date:   Tue, 20 Aug 2019 21:47:14 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Tom Evans <tom.evans@motec.com.au>, linux-rtc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: rv3029: Revert my error handling patch to
 rv3029_eeprom_write()
Message-ID: <20190820194714.GV3545@piout.net>
References: <20190817065604.GB29951@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190817065604.GB29951@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/08/2019 09:56:04+0300, Dan Carpenter wrote:
> My error handling "cleanup" was totally wrong.  Both the "err" and "ret"
> variables are required.  The "err" variable holds the error codes for
> rv3029_eeprom_enter/exit() and the "ret" variable holds the error codes
> for if actual write fails.  In my patch if the write failed, the
> function probably still returned success.
> 
> Reported-by: Tom Evans <tom.evans@motec.com.au>
> Fixes: 97f5b0379c38 ("rtc: rv3029: Clean up error handling in rv3029_eeprom_write()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rtc/rtc-rv3029c2.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
