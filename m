Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC7324C796
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Aug 2020 00:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgHTWKw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Aug 2020 18:10:52 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58227 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgHTWKv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Aug 2020 18:10:51 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F1BF1240003;
        Thu, 20 Aug 2020 22:10:48 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     LKML <linux-kernel@vger.kernel.org>,
        Victor Ding <victording@google.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH v2] rtc: cmos: zero-init wkalrm when reading from CMOS
Date:   Fri, 21 Aug 2020 00:10:48 +0200
Message-Id: <159796143347.2239022.2687430267906057170.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814191654.v2.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
References: <20200814191654.v2.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 14 Aug 2020 19:17:30 +1000, Victor Ding wrote:
> cmos_read_alarm() may leave certain fields of a struct rtc_wkalrm
> untouched; therefore, these fields contain garbage if not properly
> initialized, leading to inconsistent values when converting into
> time64_t. This patch to zero initialize the struct before calling
> cmos_read_alarm().
> 
> Note that this patch is not intended to produce a correct time64_t, it
> is only to produce a consistent value. In the case of suspend/resume, a
> correct time64_t is not necessary; a consistent value is sufficient to
> correctly perform an equality test for t_current_expires and
> t_saved_expires. Logic to deduce a correct time64_t is expensive and
> hence should be avoided.

Applied, thanks!

[1/1] rtc: cmos: zero-init wkalrm when reading from CMOS
      commit: c254bcd7231a3eeafc453f6ee3a483a2e7ff486e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
