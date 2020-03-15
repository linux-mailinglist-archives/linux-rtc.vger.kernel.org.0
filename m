Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84E3185C59
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Mar 2020 13:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgCOM1T (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 15 Mar 2020 08:27:19 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:51901 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728484AbgCOM1T (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 15 Mar 2020 08:27:19 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 75BD724000C;
        Sun, 15 Mar 2020 12:27:17 +0000 (UTC)
Date:   Sun, 15 Mar 2020 13:27:16 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] rtc: snvs: remove redundant error message
Message-ID: <20200315122716.GF4518@piout.net>
References: <1584233264-26025-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584233264-26025-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 15/03/2020 08:47:44+0800, Anson Huang wrote:
> The RTC core already has error message for registration failure,
> no need to have error message in the driver again.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-snvs.c | 2 --
>  1 file changed, 2 deletions(-)
> 

I squashed that one in your previous patch.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
