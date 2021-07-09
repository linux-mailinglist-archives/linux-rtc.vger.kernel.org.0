Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F3A3C2BE2
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 01:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhGJAB2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 20:01:28 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36251 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhGJAB2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 20:01:28 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4AA77E0002;
        Fri,  9 Jul 2021 23:58:42 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 00/10] Update SPDX identifier
Date:   Sat, 10 Jul 2021 01:58:41 +0200
Message-Id: <162587485270.1199038.16369621914134045382.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 7 Jul 2021 16:57:54 +0900, Nobuhiro Iwamatsu wrote:
> Some RTC drivers have not migrated to SPDX identifiers. This
> modifies the SPDX identifier migration and formatting.
> 
> Best regards,
>   Nobuhiro
> 
> Nobuhiro Iwamatsu (10):
>   rtc: au1xxx: convert to SPDX identifier
>   rtc: ds1374: convert to SPDX identifier
>   rtc: max6900: convert to SPDX identifier
>   rtc: palmas: convert to SPDX identifier
>   rtc: sc27xx: Fix format of SPDX identifier
>   rtc: rtd119x: Fix format of SPDX identifier
>   rtc: tps80031: convert to SPDX identifier
>   rtc: tps6586x: convert to SPDX identifier
>   rtc: starfire: convert to SPDX identifier
>   rtc: spear: convert to SPDX identifier
> 
> [...]

Appliedi [1-8] and 10, thanks!

[01/10] rtc: au1xxx: convert to SPDX identifier
        commit: 299e726f77f924b1233873cd2a1974a654119539
[02/10] rtc: ds1374: convert to SPDX identifier
        commit: 67561a8e1ed184b2f7c029bb160f2b6239255e29
[03/10] rtc: max6900: convert to SPDX identifier
        commit: cd13635e1c7d17b0e105531d2bbdd1a537ce00da
[04/10] rtc: palmas: convert to SPDX identifier
        commit: 1d9539ed2da86296de04173c413378459cf6eb32
[05/10] rtc: sc27xx: Fix format of SPDX identifier
        commit: 078699417a3983873fcc883312069b20f5923cbe
[06/10] rtc: rtd119x: Fix format of SPDX identifier
        commit: 41a2ed5c710774f3ac3c7cae4e2aa5f8e09ba4b4
[07/10] rtc: tps80031: convert to SPDX identifier
        commit: 3f019164816fb7da6dd8b369e9bf584b97ba9654
[08/10] rtc: tps6586x: convert to SPDX identifier
        commit: 9d0c49fa115c9c9e16853d6c05f4fdf1420f790b
[10/10] rtc: spear: convert to SPDX identifier
        commit: 9734a1ae34ecedf8aeaa842c9b3541cf8421c546

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
