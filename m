Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67FF91385E7
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2020 12:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732643AbgALLDz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 12 Jan 2020 06:03:55 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:56863 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732641AbgALLDz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 12 Jan 2020 06:03:55 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 153A4FF803;
        Sun, 12 Jan 2020 11:03:53 +0000 (UTC)
Date:   Sun, 12 Jan 2020 12:03:53 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
Message-ID: <20200112110353.GC1253990@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 02/01/2020 19:40:10+1100, JH wrote:
> Hi,
> 
> I am running kernel 4.19 on imx6, could anyone help for clues what
> that error is about? What I could be missing and how to fix it?
> 

I'd say that you have an issue with the 32k clock or tamper detection,
have a look at this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cd7f3a249dbed2858e6c2f30e5be7f1f7a709ee2


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
