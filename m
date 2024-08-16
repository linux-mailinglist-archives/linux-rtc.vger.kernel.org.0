Return-Path: <linux-rtc+bounces-1673-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FC954AE2
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2024 15:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 630321F23428
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2024 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDB91B32AA;
	Fri, 16 Aug 2024 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b="psNTm3dT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hotelshavens.com (mail.hotelshavens.com [217.156.64.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB61B0122
	for <linux-rtc@vger.kernel.org>; Fri, 16 Aug 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.156.64.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723814458; cv=none; b=dqm1FiiulK0L6MEyp2+wmEZU7oLcv4rw8L6yomThjMnxQF9PqqmuoUYdv4r/fIwBinMYeEoUXL3z+vXs9QmQU/FA+j+T+1VOwXDjg3Q471SYFpsmxtNMt/7Eg6L17mx6/cyy8KJz/lqzP0vcrdNxDfh0gRdHfgvPyTv6xzIr358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723814458; c=relaxed/simple;
	bh=/6jcDNMBGenr1bB3lQRXbzCZ3ZXmvJqWDeW0bbrdZhM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LmGR7EvZLl8alMIC57vSRtcJUpHY2lfTNK1/SHOnJ5zaeouPvk5CAeAGADYTvqtf6yL9cFMpEFhe1UNsf0mhWy99ISIpuesmQGTb9q2FRXV9z6K1bkTJq0R28XtgS73+AoZTaOSoa2SB41OKKuB0PKtLbTfvpAne9N0cPZbFkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com; spf=pass smtp.mailfrom=hotelshavens.com; dkim=pass (4096-bit key) header.d=hotelshavens.com header.i=admin@hotelshavens.com header.b=psNTm3dT; arc=none smtp.client-ip=217.156.64.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotelshavens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotelshavens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=hotelshavens.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=admin@hotelshavens.com;
 bh=/6jcDNMBGenr1bB3lQRXbzCZ3ZXmvJqWDeW0bbrdZhM=;
 b=psNTm3dTIIKCkJSONQG0prIXKw4KTJGBDm/0NvsCzaIw8VybGqbsGGs78TIzoQD2rlJ7llA+qMaL
   kx5Fj3cvY80tinAlYY3QMYA9Q0CHdhz1amplaHY0/uzdrt31hHqxqmpkDJQjZgmBpmhh7hVZWlDJ
   fMsLyds+dZAq5eLLx10Y6TDV6cx23AKGlKILklrHetXLSAqQ8J8If/8YzGQBzzGwTbDgCQQwQk0t
   Rdpuk2SJALdJJTG9LX6Oe+qpY7/XG1kGODaaZ/Feih3SOsDy24c/qziNkSU4e1tP1BFuZ63ZoNeP
   umdMdqJeK6YeMSI5Aw8KoO7qUBX0Ys0jhayJP+1aQ3/ypx5BtnuS/QcoNj7UOj1C6lbInPaWrAA3
   ZGwv+yHOjGOy6vUS0jrjKbTB4JGNnXCQOfNOMBfSww4EQy1d0UaUOv4VWHZxr+H+/MgqYudGLBdj
   97MT8bCRfoNhprYA9WbtjdFHwInAHL8oBJmCeHl1PP3QcCyYb1FeRdYMTy8vuwBolRtgcYfGGZLX
   /9TmPsA761nol06YBa0/BJhdqJsQfFA5SmhHdKU8Gzdw1PsJNmzVO9hFIaVbAjgWfpMaOe3GDKQC
   aYzxrZfpTAiRrLvsUHC3ydYRM4OftAg51Z6ECmltyce42YHW9MpHD5Ifr5mW9+o5IaOHNWVp7iQ=
Reply-To: boris@undpkh.com
From: Boris Soroka <admin@hotelshavens.com>
To: linux-rtc@vger.kernel.org
Subject: HI DEAR !
Date: 16 Aug 2024 15:14:20 +0200
Message-ID: <20240816134828.7A24AF6F900F945F@hotelshavens.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

Did you receive my last email message I sent to this Email=20
address: ( linux-rtc@vger.kernel.org ) concerning relocating my=20
investment to your country due to the on going war in my country=20
Russia.

Best Regards,
Mr.Boris Soroka.

