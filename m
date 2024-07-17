Return-Path: <linux-rtc+bounces-1541-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E49338C4
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 10:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237E91C22B30
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 08:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B44B22F1E;
	Wed, 17 Jul 2024 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s4H2zIyk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845601CAA4;
	Wed, 17 Jul 2024 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721204213; cv=none; b=meSwULna5zgC/926WyoJYHYuFs2Nl3hMhW/EOFGbtmF672lO3FEIKC1lpdzX6F882k8NfPA2Mo2/IjEtsiUdSEq5gDqqEE3rvnM/u/Wrklxy2NKZEpY9op6oRFylqG10oJuZRcRzllEuFFRQvLYpXQV66/+uveKxdLAfL28b95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721204213; c=relaxed/simple;
	bh=Ubxr2HkffdDfbaVcxMhcSzsYcYW5gclo6c8pnhBSBTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbnBraa+v1+Ajof0Ygk5jAmV0xC4QXbHldFuoOCO54BCCsjhaGGed1BJa2sZ3T0FnXPfpl5SPyazzOPdDauPWgRNMQaczxImrhA3Kijjfmj0Y5dRcvtUzM8q1VT1MynFYivfGePDeeu1mcXsOskBWd/WtmEHUU5wmMIl1or7gjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s4H2zIyk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ubxr2HkffdDfbaVcxMhcSzsYcYW5gclo6c8pnhBSBTo=; b=s4H2zIykYAdHu2e12j8bWR+lA+
	bFe0KKcSZ5gayA4MRqNRYIvLkSl0l5Nt7sBnGBoHWdcJOIwwfwqN0NMO3aUjPMjLYTqB8x1/3rgGq
	DrgMtgj3KCYLTvVnAVQWVaXoqd54sHyl+ugb8MKZJcjEXXkBYk/yO2lEepUmyjOKI4idGn/68Bz2p
	9mQ9s4K2ijqTBdI6aaddI0GomF/uOf5t+Ol7d6dbKmpE25H+w0Jcraz0Vt9p1kN98bopYHtix8La1
	wMWqOJeGCmbR1a6/j2RF0xVtQbm5zT3Z3QIyhMsbt0806F+AmqlIme13FQWolG4PnwlvUFsjE3pFM
	PwQZLKmA==;
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=freeip.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzqD-00000000ZPB-0hAP;
	Wed, 17 Jul 2024 08:16:49 +0000
Message-ID: <bd22215e26f79daa1b5da3482118a6f4c38a124b.camel@infradead.org>
Subject: Re: [RFC PATCH v4] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev, "Luu, Ryan"
 <rluu@amazon.com>, "Chashper, David" <chashper@amazon.com>
Cc: "Christopher S . Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Date: Wed, 17 Jul 2024 09:16:47 +0100
In-Reply-To: <10db46e9-b753-43bb-a826-14d4c11026bd@opensynergy.com>
References: <20240708092924.1473461-1-dwmw2@infradead.org>
	 <060f392c-7ba9-4ff6-be82-c64f542abaa1@opensynergy.com>
	 <98b20feebf4e7a11870dca725c03ee4e411b1aa3.camel@infradead.org>
	 <1c24e450-5180-46c2-8892-b10709a881e5@opensynergy.com>
	 <1ca48fb47723ed16f860611ac230ded7a1ca07f1.camel@infradead.org>
	 <9f132922-2bf7-4749-b8c7-4c57445f9cde@opensynergy.com>
	 <DD886A0D-B8E2-4749-AB21-7B26A4B70374@infradead.org>
	 <10db46e9-b753-43bb-a826-14d4c11026bd@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Hyh+17g2MeZ+GIA0VPiP"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-Hyh+17g2MeZ+GIA0VPiP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-07-16 at 15:20 +0200, Peter Hilber wrote:
> On 16.07.24 14:32, David Woodhouse wrote:
> > On 16 July 2024 12:54:52 BST, Peter Hilber <peter.hilber@opensynergy.co=
m> wrote:
> > > On 11.07.24 09:50, David Woodhouse wrote:
> > > > On Thu, 2024-07-11 at 09:25 +0200, Peter Hilber wrote:
> > > > >=20
> > > > > IMHO this phrasing is better, since it directly refers to the sta=
te of the
> > > > > structure.
> > > >=20
> > > > Thanks. I'll update it.
> > > >=20
> > > > > AFAIU if there would be abnormal delays in store buffers, causing=
 some
> > > > > driver to still see the old clock for some time, the monotonicity=
 could be
> > > > > violated:
> > > > >=20
> > > > > 1. device writes new, much slower clock to store buffer
> > > > > 2. some time passes
> > > > > 3. driver reads old, much faster clock
> > > > > 4. device writes store buffer to cache
> > > > > 5. driver reads new, much slower clock
> > > > >=20
> > > > > But I hope such delays do not occur.
> > > >=20
> > > > For the case of the hypervisor=E2=86=90=E2=86=92guest interface thi=
s should be handled
> > > > by the use of memory barriers and the seqcount lock.
> > > >=20
> > > > The guest driver reads the seqcount, performs a read memory barrier=
,
> > > > then reads the contents of the structure. Then performs *another* r=
ead
> > > > memory barrier, and checks the seqcount hasn't changed:
> > > > https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dblob;f=3Dd=
rivers/ptp/ptp_vmclock.c;hb=3Dvmclock#l351
> > > >=20
> > > > The converse happens with write barriers on the hypervisor side:
> > > > https://git.infradead.org/?p=3Dusers/dwmw2/qemu.git;a=3Dblob;f=3Dhw=
/acpi/vmclock.c;hb=3Dvmclock#l68
> > >=20
> > > My point is that, looking at the above steps 1. - 5.:
> > >=20
> > > 3. read HW counter, smp_rmb, read seqcount
> > > 4. store seqcount, smp_wmb, stores, smp_wmb, store seqcount become ef=
fective
> > > 5. read seqcount, smp_rmb, read HW counter
> > >=20
> > > AFAIU this would still be a theoretical problem suggesting the use of
> > > stronger barriers.
> >=20
> > This seems like a bug on the guest side. The HW counter needs to be rea=
d *within* the (paired, matching) seqcount reads, not before or after.
> >=20
> >=20
>=20
> There would be paired reads:
>=20
> 1. device writes new, much slower clock to store buffer
> 2. some time passes
> 3. read seqcount, smp_rmb, ..., read HW counter, smp_rmb, read seqcount
> 4. store seqcount, smp_wmb, stores, smp_wmb, store seqcount all become
> =C2=A0=C2=A0 effective only now
> 5. read seqcount, smp_rmb, read HW counter, ..., smp_rmb, read seqcount
>=20
> I just omitted the parts which do not necessarily need to happen close to
> 4. for the monotonicity to be violated. My point is that 1. could become
> visible to other cores long after it happened on the local core (during
> 4.).

Oh, I see. That would be a bug on the device side then. And as you say,
it could be fixed by using the appropriate barriers. Or my alternative
of just documenting "Don't Do That Then".


--=-Hyh+17g2MeZ+GIA0VPiP
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzE3MDgxNjQ3WjAvBgkqhkiG9w0BCQQxIgQgf22pgYrq
GhXZGTzWg3OaHlGHl9lO7vtt+2OiqKtMKU8wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAjitrHv53ZXQEvtaUKAVW0R+5m1FI/MtGC
M+sBTrHyVweJgj3lbDcG7rBMXZ+oO4HAD/Tf/AMmoq8mucTnTSQWul/zz2e8PBEJHJ77diFcxeez
IQ5bIYFs4nDw4dUaA4u2O6ZKnRWJj7zK7oqqZv+ipwW+NoHdA+0zBYptyYgT9y3RQ4gXh6jb7C76
AfNwo6WwJzcZ0VB67IWaJpAiHPs3SoHPAd+iYhKQve5HOZGBhfWqbQQqD0n4K1hOdwouXJFW1NFK
SOrusnzCC4Q2U7i6gWIGSSY2WLJCOinBmDUn9JD8VJ+2IafPTA9zIUjHwtBF0kzRAorqJZ+Ua+9D
97dJTzGl6NS2dXmKAAvBCy28BA15HzZ2PA2UaIhhvsYJ1Dd0wX33kQ/fqZ2ud5ku/mGoOTlneqTg
Sf9itka2jWUaVpwuTVIFckPhIWnqneV6JcMWfzskZ20ALzeber/O/CIIOSjlCvv8qQmsHBFldGOd
IEQfg+k2x7ZNqdMivuRiWx37QiyGNmlzIseSpCZaEFhjZI1vnDxhuo0VCle6CPrCpqap8QBrU6m6
vAhjQMjyUSueGmN8gK3Kzgd9zA7g96rOBf8xtt/PCbCIcpbhzSNgPMoCe1877bIvFta8SuNPFI7+
tjY69i3E64LODqch+51R2Nahh1Rf4dJu0HmjJVI8bQAAAAAAAA==


--=-Hyh+17g2MeZ+GIA0VPiP--

