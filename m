Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD263DA3A9
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Jul 2021 15:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237222AbhG2NFw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Jul 2021 09:05:52 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:47953 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbhG2NFw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Jul 2021 09:05:52 -0400
X-Greylist: delayed 17945 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Jul 2021 09:05:51 EDT
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 449CE260EC;
        Thu, 29 Jul 2021 13:05:47 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 39DDF3F201;
        Thu, 29 Jul 2021 13:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 1817A2A0D1;
        Thu, 29 Jul 2021 09:05:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1627563945;
        bh=5vcSiXiJq1vyGGMAj0g4J/Y/RySHDPXvj3CJRgr1fWs=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=yXrbnHU9HGlTVNmAjwrPmg57EMx7sd1aiQ7tWVpq4DKpLHZ/5ScRlUgXxKUbHWx1R
         k+/geg2cLCHV9gg3Ngit36wPVCDv9fxj+q+ZmNnvKrM77zk12U5AxReO9+gcXL+0OW
         rZV8eIhMhR9ilCy4yVN+2Y/0UVh77Z7H0MCAR0bM=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mw1wZ6RQBUBU; Thu, 29 Jul 2021 09:05:44 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 29 Jul 2021 09:05:43 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 014A442015;
        Thu, 29 Jul 2021 13:05:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="ZxDQIRWn";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [27.38.203.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id AD7A3436B9;
        Thu, 29 Jul 2021 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1627563887; bh=5vcSiXiJq1vyGGMAj0g4J/Y/RySHDPXvj3CJRgr1fWs=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=ZxDQIRWnfuAeY1pbweuOXmoEI0mptaGrY9HKlCXWso705fAwwWnovxSQFCxsQqkof
         CNS1X1Uvh4nBm3vcYL7lXcg1O139pP+wZ4THDa0eS2eohC8sGvIj3m21pDj8aNjL8U
         krM6HfGah79y8UK3EzE6qzpN1TfOq2fRflb7T1GE=
Date:   Thu, 29 Jul 2021 21:04:21 +0800
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Maxime Ripard <maxime@cerno.tech>
CC:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_06/19=5D_rtc=3A_sun6i=3A_Add_s?= =?US-ASCII?Q?upport_for_RTCs_without_external_LOSCs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20210729103228.prdav7eobi52y3ny@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com> <20210615110636.23403-7-andre.przywara@arm.com> <20210616091431.6tm3zdf77p2x3upc@gilmour> <1e49692a2f4548ae942e170bc1ae9431a6eb512e.camel@aosc.io> <20210729103228.prdav7eobi52y3ny@gilmour>
Message-ID: <E4567E12-60C1-4DF5-89D6-C93DC3152D4F@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 014A442015
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [2.60 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[aosc.io];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_TWELVE(0.00)[14];
         SUBJ_EXCESS_QP(1.20)[];
         RECEIVED_SPAMHAUS_PBL(0.00)[27.38.203.54:received];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[arm.com,csie.org,gmail.com,kernel.org,sholland.org,lists.infradead.org,googlegroups.com,lists.linux.dev,vger.kernel.org,megous.com,towertech.it,bootlin.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



=E4=BA=8E 2021=E5=B9=B47=E6=9C=8829=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886=
:32:28, Maxime Ripard <maxime@cerno=2Etech> =E5=86=99=E5=88=B0:
>On Thu, Jul 29, 2021 at 04:04:10PM +0800, Icenowy Zheng wrote:
>> =E5=9C=A8 2021-06-16=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:14 +0200=EF=
=BC=8CMaxime Ripard=E5=86=99=E9=81=93=EF=BC=9A
>> > Hi,
>> >=20
>> > On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
>> > > Some newer Allwinner RTCs (for instance the one in the H616 SoC)
>> > > lack
>> > > a pin for an external 32768 Hz oscillator=2E As a consequence, this
>> > > LOSC
>> > > can't be selected as the RTC clock source, and we must rely on the
>> > > internal RC oscillator=2E
>> > > To allow additions of clocks to the RTC node, add a feature bit to
>> > > ignore
>> > > any provided clocks for now (the current code would think this is
>> > > the
>> > > external LOSC)=2E Later DTs and code can then for instance add the
>> > > PLL
>> > > based clock input, and older kernel won't get confused=2E
>> > >=20
>> > > Signed-off-by: Andre Przywara <andre=2Eprzywara@arm=2Ecom>
>> >=20
>> > Honestly, I don't really know if it's worth it at this point=2E
>> >=20
>> > If we sums this up:
>> >=20
>> > =C2=A0- The RTC has 2 features that we use, mostly centered around 2
>> > =C2=A0=C2=A0 registers set plus a global one
>> >=20
>> > =C2=A0- Those 2 features are programmed in a completely different way
>> >=20
>> > =C2=A0- Even the common part is different, given the discussion aroun=
d the
>> > =C2=A0=C2=A0 clocks that we have=2E
>> >=20
>> > What is there to share in that driver aside from the probe, and maybe
>> > the interrupt handling? Instead of complicating this further with
>> > more
>> > special case that you were (rightfully) complaining about, shouldn't
>> > we
>> > just acknowledge the fact that it's a completely separate design and
>> > should be treated as such, with a completely separate driver?
>>=20
>> I think our problem is just that we're having a single driver for both
>> functionalities (clock manager and RTC)=2E
>>=20
>> Personally I don't think we should have seperated driver for clock
>> managers, although I am fine with seperated RTC driver for linear days=
=2E
>
>Why do you think it's a bad idea to have the RTC and clocks in the same
>driver?

Well you really misread, I'm just thinking we shouldn't have a new driver
from scratch=2E As we're going to have a single sun6i-rtc, please allow H6=
16
and R329 to enter it=2E

>
>Maxime
