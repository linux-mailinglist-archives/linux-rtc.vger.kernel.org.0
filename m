Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F98320DD99
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2020 23:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731950AbgF2TUL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 15:20:11 -0400
Received: from muru.com ([72.249.23.125]:59966 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727020AbgF2TUK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:20:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 066AB8102;
        Mon, 29 Jun 2020 14:35:49 +0000 (UTC)
Date:   Mon, 29 Jun 2020 07:34:54 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dev Null <devnull@uvos.xyz>, Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-rtc@vger.kernel.org, "Sicelo A . Mhlongo" <absicsz@gmail.com>
Subject: Re: [PATCH] rtc: cpcap: fix range
Message-ID: <20200629143454.GP37466@atomide.com>
References: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
 <20200629114123.27956-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629114123.27956-1-sebastian.reichel@collabora.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

* Sebastian Reichel <sebastian.reichel@collabora.com> [200629 11:42]:
> Unbreak CPCAP driver, which has one more bit in the day counter
> increasing the max. range from 2014 to 2058. The original commit
> introducing the range limit was obviously wrong, since the driver
> has only been written in 2017 (3 years after 14 bits would have
> run out).

So I guess with 14 bits vs 15 bits we have these date ranges:

1970 + (0x3fff / 365) = 2014
1970 + (0x7fff / 365) = 2059

Meaning we can't do the whole year for 2059 and it's only 2058
compatible like you say above :)

Acked-by: Tony Lindgren <tony@atomide.com>



