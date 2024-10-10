Return-Path: <linux-rtc+bounces-2159-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F286B998DA1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 18:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C36D1F249D1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 16:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE7E19994D;
	Thu, 10 Oct 2024 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="qZkcaqrg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063C197A93;
	Thu, 10 Oct 2024 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578394; cv=none; b=J07TFilGU+9Ni4ApJoqApNkS8A9BRK8Ff9om3bgOGQPTNeBQUQyQNhxBUYcPhZT74cwSZz3ijl/3kdg4LnYFFdYPC15xHgyS6BNf0NFxKnq03BAJ4qBEGgliccZ3t6uj8J863/GhBxuebgItlBwg49+vfJRhwU2oU6IcN1Td+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578394; c=relaxed/simple;
	bh=Xd37zg5BJM7c5WIBTArQwS/JIayqBeMlo0qG2QztxLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=DtbF9Ckn5KwEc/4+OJ2agZtcRp1KwgxNyO85gPgPyLVmQUkeZggGGwBmv/zQ1nC9v+aSOMUmeSBc8SwCgddAvJNnXGD2EYk8DWVajoeouGU/q8kktTLEM5yCrSq6MrfE5BwNwYzZvgfw1FQnRR4C2sW29Xe0QgfvqQ+clI7masA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=qZkcaqrg; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1728578371; x=1729878371;
	bh=H8YPI/0h+C1Q9Ky3OKe5LMlx34aYg+9FLhZmsfK1+c8=; h=From;
	b=qZkcaqrgKNgv21y8Vi4g1N3iiauctXSH50bS8tFs/iwgehbVTXZxvglmyPWcVpcpY
	 tOlwVsFKOtQVsNgzn3ydaiQicGoBWsfNugQV8SNy1XoIHlFlrhL4/mP5WNfFugR1+2
	 Sn7/gTe1vhyETFZrHKKrZPLmxMnEoJ9VZbH/6glD8LJo2WJUHcqUozI+GoA3BYxOrP
	 tvPhnHjV/fzmIshBGbVUctBgS1T7Dvg9zPvEQT/XIkx+SZljx7+5RX+N1z2NYpb5xr
	 kqb8Dh7ThttCaM8VNkL/O6zN8ilqOJyq407QHbTnlj5qF+O3WzQK/joDp6qE9bnN0V
	 5f47720TScIZA==
Received: from localhost (cdwifi-a110.cd-t.cz [213.235.133.110] (may be forged))
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 49AGdTLW076650
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 18:39:31 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Oct 2024 18:40:26 +0200
Message-Id: <D4S9WUGGL00V.16E4ARKMPS1JJ@matfyz.cz>
Cc: <duje.mihanovic@skole.hr>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
To: "Lee Jones" <lee@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
 <D4RIBTPD0W5Y.198XNBY2OIDGL@matfyz.cz> <20241010083100.GB661995@google.com>
 <20241010083519.GC661995@google.com>
In-Reply-To: <20241010083519.GC661995@google.com>

Lee Jones, 2024-10-10T09:35:19+01:00:
> On Thu, 10 Oct 2024, Lee Jones wrote:
>
> > On Wed, 09 Oct 2024, Karel Balej wrote:
> >=20
> > > Lee Jones, 2024-10-09T11:06:43+01:00:
> > > > On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > > > > RTC lives on the base register page of the chip. Add definitions =
of the
> > > > > registers needed for a basic set/read time functionality.
> > > > >=20
> > > > >=20
> > > >
> > > > Applied, thanks!
> > >=20
> > > Thank you, however I'm a little perplexed.
> > >=20
> > > It was my understanding that RFC patches should not be applied withou=
t
> > > further agreement, is that not the case? Obviously this patch was ver=
y
> > > simple and I used RFC mainly because of the RTC driver itself, but I'=
m
> > > curious to know for future submissions.
> >=20
> > I missed the fact that this was an RFC.  I can unapply it if you like?
> >=20
> > > Also, I expected the entire series to go at once through the rtc tree
> > > with your ack as while it is not a strict dependency in terms of
> > > breakage, the first patch seems rather pointless without the follow-u=
p
> > > which could theoretically take a long time to get applied and even so=
me
> > > requested changes could require changes to this patch. Could you plea=
se
> > > explain what the policy is on this?
> >=20
> > The policy is flexible.  However, the generally accepted rule is that i=
f
> > there are build-time dependencies between patches, then one maintainer
> > (usually me since MFD is usually at the centre of these cross-subsystem
> > patch-sets) takes them and sends out a pull-request for an immutable
> > branch for the other maintainers to pull from.
> >=20
> > However in this case, there are no build-time dependencies so the
> > patches are able to and therefore should go in via their respective
> > repos.
>
> Actually, it looks like there are build-time deps between them.

Indeed, I didn't realize that yesterday. What I had in mind before was
in fact the other part of the patch: I was wondering about the policy of
applying a patch adding a MFD cell for which there is no driver
available. That's what I meant by "not a strict dependency in terms of
breakage".

> Please break out the inclusion of the additional defines and place them
> into the RTC patch.  I will then Ack that one.  The patch making changes
> to driver/mfd will still go in via the MFD repo.

So the above in other words: it sounds like you would apply this updated
patch independently of the RTC driver because otherwise you could just
ack the current version, is that correct? If so, I cannot see why this
would be preferable given what I wrote before about the RTC driver being
possibly delayed or eventually given up on (not that I would expect that
to be the case here :-). Could you please still comment on this then?

Thank you,
K. B.

