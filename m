Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE820418027
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Sep 2021 09:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhIYHHj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 03:07:39 -0400
Received: from mail.hostpark.net ([212.243.197.30]:33446 "EHLO
        mail.hostpark.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhIYHHi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 03:07:38 -0400
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Sep 2021 03:07:38 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTP id AF9A0165CB
        for <linux-rtc@vger.kernel.org>; Sat, 25 Sep 2021 09:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=elsoft.ch; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :user-agent:date:date:message-id:organization:subject:subject
        :from:from:received:received; s=sel2011a; t=1632553204; bh=eP9dx
        Xz5wGrpDp7Emzk4YGDZqx69+0W/qwDBF4zv2Ck=; b=I5BRS7Wy5McYZ56e3um08
        kxKS4w01oZopVZBoCwlUL1JKWGyyVVG0dUraRaT5tz/FJHVt0knh5hG7sV56Go+d
        /zpFu8i0ndkX/V6gSMITLAcKcKR5Lz/7a1E4e2P6su6slApiennmaaWBQk774lx6
        mK89xWnfaiRZAFSEVLRQfg=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
        by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
        with ESMTP id 6OjPJKKE0Sgr for <linux-rtc@vger.kernel.org>;
        Sat, 25 Sep 2021 09:00:04 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by mail.hostpark.net (Postfix) with ESMTPA id 7BDE2165C1
        for <linux-rtc@vger.kernel.org>; Sat, 25 Sep 2021 09:00:01 +0200 (CEST)
From:   =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Subject: rtc-pcf8563: STOP bit usage during time update?
To:     linux-rtc@vger.kernel.org
Openpgp: preference=signencrypt
Organization: ELSOFT AG
Message-ID: <43a688c4-f721-ce3f-f6fc-c1065cc12b68@elsoft.ch>
Date:   Sat, 25 Sep 2021 09:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello

According to the example on page 30 of the EPSON datasheet
https://support.epson.biz/td/api/doc_check.php?dl=app_RTC-8564JE&lang=en
for the 8564 version of this chip, the time update sequence is as follows:

- set CTRLSTS1[STOP] bit to 1
- update time registers
- set CTRLSTS1[STOP] bit to 0

The NXP datasheet is not so explicit regarding STOP bit handling.

Nevertheless I don't see any STOP bit related action in the driver:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-pcf8563.c?h=v5.14#n244

Am I overlooking or missing something here?
