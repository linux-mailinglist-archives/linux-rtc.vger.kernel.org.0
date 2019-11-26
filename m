Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC9C910A699
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2019 23:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfKZWfk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Nov 2019 17:35:40 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38515 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfKZWfk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Nov 2019 17:35:40 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E8BDF1BF205;
        Tue, 26 Nov 2019 22:35:38 +0000 (UTC)
Date:   Tue, 26 Nov 2019 23:35:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org, david.paris@st.com
Subject: Re: [PATCH] rtc: st-lpc: Remove struct resource from struct st_rtc
Message-ID: <20191126223538.GA299836@piout.net>
References: <20191123091241.1905-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191123091241.1905-1-nobuhiro1.iwamatsu@toshiba.co.jp>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/11/2019 18:12:41+0900, Nobuhiro Iwamatsu wrote:
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> 
> struct resource in struct st_rtc is not used, remove it.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  drivers/rtc/rtc-st-lpc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
