Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBACE29AAEF
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Oct 2020 12:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411539AbgJ0Lcg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Oct 2020 07:32:36 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48475 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438817AbgJ0Lcf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 27 Oct 2020 07:32:35 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 575A41BF209;
        Tue, 27 Oct 2020 11:32:33 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-janitors@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
Date:   Tue, 27 Oct 2020 12:32:32 +0100
Message-Id: <160379780345.96488.3985201259905259323.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022070451.GA2817669@mwanda>
References: <20201022070451.GA2817669@mwanda>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 22 Oct 2020 10:04:51 +0300, Dan Carpenter wrote:
> These functions should return zero on success.  Non-zero returns are
> treated as error.  On some paths, this doesn't matter but in
> nvmem_cell_read() a non-zero return would be passed to ERR_PTR() and
> lead to an Oops.

Applied, thanks!

[1/1] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
      commit: ba1c30bf3f2536f248d262c6f257b5a787305991

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
