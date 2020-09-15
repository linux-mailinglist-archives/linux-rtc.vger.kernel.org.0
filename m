Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414C326A20E
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 11:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIOJWB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 05:22:01 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:39633 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIOJWB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 05:22:01 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CD7B8240002;
        Tue, 15 Sep 2020 09:21:58 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rtc: st-lpc: Constify st_rtc_ops
Date:   Tue, 15 Sep 2020 11:21:58 +0200
Message-Id: <160016171046.325179.3123778161718568231.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200913122644.35515-1-rikard.falkeborn@gmail.com>
References: <20200913122644.35515-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 13 Sep 2020 14:26:44 +0200, Rikard Falkeborn wrote:
> The only usage of st_rtc_ops is to assign its address to the ops field
> in the rtc_device struct. which is a const pointer. Make it const to
> allow the compiler to put it in read-only memory.

Applied, thanks!

[1/1] rtc: st-lpc: Constify st_rtc_ops
      commit: d0a3b65052f041852c855ea1135659770ba0bc09

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
