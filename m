Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5212A3AE04B
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 22:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhFTUfm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 16:35:42 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:57085 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhFTUfl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 16:35:41 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8383B240008;
        Sun, 20 Jun 2021 20:33:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: v3020: remove redundant initialization of variable retval
Date:   Sun, 20 Jun 2021 22:33:23 +0200
Message-Id: <162422118505.1090685.17421473715592582970.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609120050.185746-1-colin.king@canonical.com>
References: <20210609120050.185746-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 9 Jun 2021 13:00:50 +0100, Colin King wrote:
> The variable retval is being initialized with a value that is never read,
> it is being updated later on. The assignment is redundant and can be
> removed.

Applied, thanks!

[1/1] rtc: v3020: remove redundant initialization of variable retval
      commit: fc3c335226a92f69aa01061e66b60ace88475dd3

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
