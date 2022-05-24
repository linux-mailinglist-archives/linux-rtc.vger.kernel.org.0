Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B28053305C
	for <lists+linux-rtc@lfdr.de>; Tue, 24 May 2022 20:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240298AbiEXSYG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 May 2022 14:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240290AbiEXSYF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 May 2022 14:24:05 -0400
X-Greylist: delayed 107 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 May 2022 11:24:03 PDT
Received: from mx-relay17-hz1.antispameurope.com (mx-relay17-hz1.antispameurope.com [94.100.132.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E062E8A303
        for <linux-rtc@vger.kernel.org>; Tue, 24 May 2022 11:24:03 -0700 (PDT)
Received: from unknown ([185.80.187.2]) by mx-relay17-hz1.antispameurope.com;
 Tue, 24 May 2022 20:22:14 +0200
Received: from grp-ex01.Vivavis.int (192.168.17.53) by grp-ex01.Vivavis.int
 (192.168.17.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 24 May
 2022 20:22:10 +0200
Received: from grp-ex01.Vivavis.int ([::1]) by grp-ex01.Vivavis.int ([::1])
 with mapi id 15.02.1118.009; Tue, 24 May 2022 20:22:10 +0200
From:   "embedded (VIVAVIS AG)" <embedded@vivavis.com>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: rv8803: Implement event/tamper detection
Thread-Topic: rv8803: Implement event/tamper detection
Thread-Index: Adhvj6/DTKSm6LqUQpuC9290DYdMzw==
Date:   Tue, 24 May 2022 18:22:10 +0000
Message-ID: <570f2b5377524e068fe6454bc9b8a1fb@vivavis.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.1]
x-c2processedorg: 2f045ba3-9b34-4118-a5bd-6c10d5957477
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-cloud-security-sender: embedded@vivavis.com
X-cloud-security-recipient: linux-rtc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay17-hz1.antispameurope.com with 99BD218416F0
X-cloud-security-connect: unknown[185.80.187.2], TLS=1, IP=185.80.187.2
X-cloud-security-Digest: 8b9bd68ed0b9c534f406e2d33cd6b840
X-cloud-security: scantime:1.612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=vivavis.com; h=from:to
        :subject:date:message-id:content-type:content-transfer-encoding
        :mime-version; s=hse1; bh=56tFkAl4sV70iGC27hNtQjkZBdnaMZRCQWyRpl
        tV4n4=; b=CYONDl4sWRXE/f3GBlNtKe7stC66//OWM15GggGrmUUEK46C0tTx4U
        RvO9GhRxLrpaGER2lIJoogNmccibRFNOysow71fe2Z6hJbLmx/UmEMgk4TwZPveo
        mi34ZDaQTDn2CszCTgAVdLgcil3GXGycn4LznPon6i2xLlY1IhcSSJnLUJ9bi8LJ
        lUT9vOpCVB+p8Ff/JCcui/S1flZSlPz85+FjHFtYklKRDJv37x+EVHF0UPiTQRW8
        G2ZZf1L3Uvx6IK4lY2/UgCd67mzKeiEWx4F6NOJzV10ZWl3LP+ZLuNwybHHiauE4
        zq1Ta70RTn+BmTWaXB3jGmq9KKkdAeYg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear maintainer,

I'd like to contribute to the rv8803 driver by implementing event/tamper de=
tection.

Micro Crystal's RV8803 as well as Epson's RX8803 provide an event input pin=
 (EVI).
This pin can be used to provide a tamper detection, which even works in bat=
tery backup
mode, when the device is not mains powered.

This feature can be enabled/disabled by bit ECP (event capture enable) with=
in the
capture/event control register of the RTC. The EHL (event high low) flag se=
lects the
positive or negative edge on the monitored EVI pin. Additionally, debouncin=
g the
event input signal can be achieved by setting ET[0:1] (event chattering rem=
oval).
All this features should be controlled by related devicetree settings.

If the external event detection feature is enabled and an event occurres, t=
he EVF flag
is set to 1. At this time, the second and 1/100 seconds registers are inter=
nally copied
to the capture/buffer registers. But this information is useless, because i=
t doesn't store
a meaningful timestamp like Unix epoch. Therefore, the EVF flag is of inter=
est, only.

To reset the external event flag, 0 must be written to the EVF bit in the R=
TC's flag register.

My question is how to provide the event/tamper information and reset logic =
to the
userspace application? Sysfs or IOCTL?

Looking around, I've found that the pcf2127 driver is using the sysfs appro=
ach.
For my needs, this will be completely adequate.

It would be great, if you can give me some guidance how to implement the in=
terface,
such that my contribution might have the chance going it's way mainline. An=
d of course,
possibly I've overlooked a patch and somebody did it already before.

Regards,

Carsten Stelling

