Return-Path: <linux-rtc+bounces-6793-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z9SnNjgYRGqtoQoAu9opvQ
	(envelope-from <linux-rtc+bounces-6793-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:25:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DA6E78A5
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 21:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b=QlZRIA5c;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6793-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6793-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B52D53099CDE
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBE23BF696;
	Tue, 30 Jun 2026 19:22:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8F2C15BE
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 19:22:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847344; cv=none; b=czYNOpvz+eTlteG1dl7v8YJlJNinpmLMOab4oRryhyFmD+WWKd0ieJIFTi6TQ2DDVbb11hY69TmjVI6L8/1lYv/SK8RD8hRsePrOSQqRE6zpI8gEQ/ZXEWMg2yejNvDMurWtVUaAWnSnAcs1jj5lAxxbnuqE+oPpWiDZfidG9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847344; c=relaxed/simple;
	bh=L1ke6m/EW3f52u6/rS3najyZ3mozYEouvds2LBdBpaQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxP1klx+WT0p424jcRMR9Ytl3iyDWjlDrPl4VMqMX9rg68NQC7C+fjQkNJLVl6OmhPfutTOIQv+FM0VYkKff8d60DBYFr3z9EfHbTR0CLG+MgnC2lJqVkkiMA3fgOisl+Boz5JEVeWo/dnN3n8qnpWyjJaNeF9ydIE3Z9KYN4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=QlZRIA5c; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 98DEB240101
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 21:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782847340; bh=17ABVu3hkFnA80avLf1nAFIDyZGlnsTtBceqCzJWQU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:Autocrypt:OpenPGP:From;
	b=QlZRIA5cjJwzN1ThjY678amd+SgitJdcxsrSIrSJL0ZKwy2/P72/eocnS0wgMWp8d
	 o7++sPRHvb0lQh2pFhmedSC7qVCv34Mxebsl/isn+RqIPv9mbAqLbrrXIihPVkpqiH
	 EXFvX94UEUWphTCA+y48kNeYqi8R14MK0UfHokUY3QYc0X8NZT119x4PNZ+7z8tyHn
	 RPc2EyC3eHz1i1BgzVAgtUt7rgU+GGpfgau84gRE7grNUaAb+V5RyCF3I+Gwj0SYWp
	 DJoHdjOe2gLo3Zz5n12un4UTg0Eu6R4S25vcxz7LAes2UmeRQqdbQFxsNews3F0E/1
	 dIhjcCRMB7UJg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gqY1k4b6Dz9rxG;
	Tue, 30 Jun 2026 21:22:18 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Subject: [PATCH 0/3] rtc: s35390a: Allow use of output pin for interrupt
 signal 1 for wakealarm
Date: Tue, 30 Jun 2026 19:22:20 +0000
Message-Id: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NUQ6CMBAFr9LstzUtDVW5iiEElkXXhKLbQkwId
 7eKn5PMm7dCJGGKUKkVhBaOPIUM9qAA7224keY+MxSm8MY7oyVhE13pLqZtOCSry9Ijds6cezd
 Anj2FBn7/ktd65zh3D8L07fwNodecv9KuQddG0jiNI6dKLadjoQUt1Nv2ASB9duKgAAAA
X-Change-ID: 20260630-rtc_s35390a_int1-556ccb308d3f
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=L1ke6m/EW3f52u6/rS3najyZ3mozYEouvds2LBdBpaQ=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqRBdpFxUnRBH1TeYge3VlQOnEr+nKJTfSd06A7
 lnc9aqBL7+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCakQXaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Lg/w//Z9V3snaDh9IxM8V1tzB0mYx7+gRHBA2
 eS9ID0NoTri82zuhDICEJi9ScrZaNhnwUQFRrdI1+JHq8T1wdbeOwLyvvDPnbRdX0cNA6U0ilE5
 CH47jWDxURHjhNrCzxfCoUyJIrcvO0u8zX3Y+VxahUja4Ky2n6xiKcziXqQ6ednOYZXZJV6eCeB
 RYipVor26fnq8cJnyIqplDraYIIqz+1m8r4Egj6zRyYDLBsvoM8Buw+z4xkKRiz+zN35tZPRELu
 lVB1bXyVfiDuCsKMzkF4q8r7no145BJbCm9N9SjyfiIhWhxh8ZaCqgZCtAiWY2fCXCcpkS/xuNV
 LE0SSCbAhAoqM/RPvNbE8ojT7Gz2kar2o3wlMOyfUqdVzpEki8f/gYEQM8BQVrKeWDfkRmK7CTr
 sdZ0MOchVtxRrWUwBQNmX/2x4xw3NBMs2jvN4Pey5BkF//Lh6eS6WSl0Ph5sVn3yxiGRpWamhjH
 cD1lqLEfVa/+KybGUIZVNKhX1aLWC0WJw9S6/nyF31TrJ3WBrQDqQfbPP/VNvbAbZvdFtZ45FaW
 kh7jsTCbvOwPPZwkn0yZG5GzatbFyaJILKM653E/4WEo9JAnHcwmtCpHg69fnf1XddBmqCKTynx
 7IuWDvEAWKVd01hJPJk0Ga8CYIkccMN6HRL9W/Fy1/91sm8Z4qL4=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=xsFNBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93qReNLkO
  WguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVAm76Ww+
  /pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt9k5JA
  RhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbmfAja
  oT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwTjRQ
  xBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1J+
  FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN6
  OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
  8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJC
  XCeMe4BO4iaxUQARAQABzRdtYXJrdXMucHJvYnN0QHBvc3Rlby5kZcLBkQQTAQgAOxYhBIJ0GMT0
  rFjncjDEczR2H/jnrUPSBQJog714AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEDR2
  H/jnrUPSgdkQAISaTk2D345ehXEkn5z2yUEjaVjHIE7ziqRaOgn/QanCgeTUinIv6L6QXUFvvIfH
  1OLPwQ1hfvEg9NnNLyFezWSy6jvoVBTIPqicD/r3FkithnQ1IDkdSjrarPMxJkvuh3l7XZHo49GV
  HQ8i5zh5w4YISrcEtE99lJisvni2Jqx7we5tey9voQFDyM8jxlSWv3pmoUTCtBkX/eKHJXosgsuS
  B4TGDCVPOjla/emI5c9MhMG7O4WEEmoSdPbmraPw66YZD6uLyhV4DPHbiDWRzXWnClHSyjB9rky9
  lausFxogvu4l9H+KDsXIadNDWdLdu1/enS/wDd9zh5S78rY2jeXaG4mnf4seEKamZ7KQ6FIHrcyP
  ezdDzssPQcTQcGRMQzCn6wP3tlGk7rsfmyHMlFqdRoNNv+ZER/OkmZFPW655zRfbMi0vtrqK2Awm
  9ggobb1oktfd9PPNXMUY+DNVlgR2G7jLnenSoQausLUm0pHoNE8TWFv851Y6SOYnvn488sP1Tki5
  F3rKwclawQFHUXTCQw+QSh9ay8xgnNZfH+u9NY7w3gPoeKBOAFcBc2BtzcgekeWS8qgEmm2/oNFV
  G0ivPQbRx8FjRKbuF7g3YhgNZZ0ac8FneuUtJ2PkSIFTZhaAiC0utvxk0ndmWFiW4acEkMZGrLaM
  L2zWNjrqwsD2zsFNBGiDvXgBEADCXQy1n7wjRxG12DOVADawjghKcG+5LtEf31WftHKLFbp/HArj
  BhkT6mj+CCI1ClqY+FYU5CK/s0ScMfLxRGLZ0Ktzawb78vOgBVFT3yB1yWBTewsAXdqNqRooaUNo
  8cG/NNJLjhccH/7PO/FWX5qftOVUJ/AIsAhKQJ18Tc8Ik73v427EDxuKb9mTAnYQFA3Ev3hAiVbO
  6Rv39amVOfJ8sqwiSUGidj2Fctg2aB5JbeMln0KCUbTD1LhEFepeKypfofAXQbGwaCjAhmkWy/q3
  IT1mUrPxOngbxdRoOx1tGUC0HCMUW1sFaJgQPMmDcR0JGPOpgsKnitsSnN7ShcCr1buel7vLnUMD
  +TAZ5opdoF6HjAvAnBQaijtK6minkrM0seNXnCg0KkV8xhMNa6zCs1rq4GgjNLJue2EmuyHooHA4
  7JMoLVHcxVeuNTp6K2+XRx0Pk4e2Lj8IVy9yEYyrywEOC5XRW37KJjsiOAsumi1rkvM7QREWgUDe
  Xs0+RpxI3QrrANh71fLMRo7LKRF3Gvw13NVCCC9ea20P4PwhgWKStkwO2NO+YJsAoS1QycMi/vKu
  0EHhknYXamaSV50oZzHKmX56vEeJHTcngrM8R1SwJCYopCx9gkz90bTVYlitJa5hloWTYeMD7FNj
  Y6jfVSzgM/K4gMgUNDW/PPGeMwARAQABwsF2BBgBCAAgFiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IF
  AmiDvXgCGwwACgkQNHYf+OetQ9LHDBAAhk+ab8+WrbS/b1/gYW3q1KDiXU719nCtfkUVXKidW5Ec
  Idlr5HGt8ilLoxSWT2Zi368iHCXS0WenGgPwlv8ifvB7TOZiiTDZROZkXjEBmU4nYjJ7GymawpWv
  oQwjMsPuq6ysbzWtOZ7eILx7cI0FjQeJ/Q2baRJub0uAZNwBOxCkAS6lpk5Fntd2u8CWmDQo4SYp
  xeuQ+pwkp0yEP30RhN2BO2DXiBEGSZSYh+ioGbCHQPIV3iVj0h6lcCPOqopZqyeCfigeacBI0nvN
  jHWz/spzF3+4OS+3RJvoHtAQmProxyGib8iVsTxgZO3UUi4TSODeEt0i0kHSPY4sCciOyXfAyYoD
  DFqhRjOEwBBxhr+scU4C1T2AflozvDwq3VSONjrKJUkhd8+WsdXxMdPFgBQuiKKwUy11mz6KQfcR
  wmDehF3UaUoxa+YIhWPbKmycxuX/D8SvnqavzAeAL1OcRbEI/HsoroVlEFbBRNBZLJUlnTPs8ZcU
  4+8rq5YX1GUrJL3jf6SAfSgO7UdkEET3PdcKFYtS+ruV1Cp5V0q4kCfI5jk25iiz8grM2wOzVSsc
  l1mEkhiEPH87HP0whhb544iioSnumd3HJKL7dzhRegsMizatupp8D65A2JziW0WKopa1iw9fti3A
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6793-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,kleine-koenig.org,lunn.ch,gmail.com];
	FORGED_SENDER(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.probst@posteo.de,m:krzk@kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[posteo.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,posteo.de:dkim,posteo.de:email,posteo.de:mid,posteo.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A9DA6E78A5

Add a dt property to allow the use of output pin for interrupt signal 1
for wakealarm. This is needed for wakealarms to work on Synology NAS
devices.

It appears there is currently no entry in the MAINTAINERS file for the
S35390A driver. I assume the driver is currently maintained by
Alexandre Belloni.

I hope its fine I added him as maintainer for the newly added devicetree
binding, in order to keep it maintained by the same person.

Also If I am not mistaken, wake alarms on these systems are currently broken:
(not tested, judged by looking at the devicetrees).

- arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dts
- arch/arm/boot/dts/marvell/armada-xp-synology-ds414.dts
- arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
- arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts
- arch/arm/boot/dts/marvell/kirkwood-ds111.dts
- arch/arm/boot/dts/marvell/kirkwood-ds112.dts
- arch/arm/boot/dts/marvell/kirkwood-ds210.dts
- arch/arm/boot/dts/marvell/kirkwood-ds212.dts
- arch/arm/boot/dts/marvell/kirkwood-ds212j.dts
- arch/arm/boot/dts/marvell/kirkwood-ds411.dts
- arch/arm/boot/dts/marvell/kirkwood-ds411j.dts
- arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts
- arch/arm/boot/dts/marvell/kirkwood-rs212.dts
- arch/arm/boot/dts/marvell/kirkwood-rs411.dts

If thats the case it can be fixed by using this patch series and adding
`sii,wakealarm-output-pin = <S35390A_OUTPUT_PIN_INT1>;` to the
s35390a devicetree.

If somebody still runs one of these systems, please test.

Thanks
- Markus Probst

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
Markus Probst (3):
      dt-bindings: rtc: Add sii,wakealarm-output-pin property for S35390A
      rtc: s35390a: Add missing newline to dev_err
      rtc: s35390a: make use of interrupt signal 1

 .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 +++++++++++++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
 MAINTAINERS                                        |  1 +
 drivers/rtc/rtc-s35390a.c                          | 63 +++++++++++++++++-----
 include/dt-bindings/rtc/s35390a.h                  |  9 ++++
 5 files changed, 114 insertions(+), 16 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20260630-rtc_s35390a_int1-556ccb308d3f


